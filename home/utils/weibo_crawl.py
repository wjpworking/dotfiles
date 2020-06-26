import requests
import math
import random
from tqdm import tqdm
import os

import sqlite3
from loguru import logger
from collections import OrderedDict
from time import sleep

from requests.adapters import HTTPAdapter

conn = sqlite3.connect('weibo.db')
cur = conn.cursor()


class Weibo(object):
    def __init__(self, config):
        self.uid = config['uid']
        self.user = {}  # 保存微博用户信息
        self.weibo_ids = set()

    def get_json(self, params):
        """获取网页中json数据"""
        url = 'https://m.weibo.cn/api/container/getIndex?'
        r = requests.get(url, params=params)
        return r.json()

    def get_user_info(self):
        """获取用户信息"""
        params = {'containerid': '100505' + str(self.uid)}
        res = self.get_json(params)
        if res['ok']:
            info = res['data']['userInfo']
            user_info = OrderedDict()
            user_info['id'] = self.uid
            user_info['screen_name'] = info.get('screen_name', '')
            user_info['statuses_count'] = info.get('statuses_count', '')
        return user_info

    def get_weibo_json(self, page):
        """获取页面中所有微博信息"""
        params = {'containerid': '107603' + str(self.uid), 'page': page}
        return self.get_json(params)

    def get_weibo_item(self, card):
        weibo_info = card['mblog']
        weibo_id = weibo_info['id']
        retweeted_status = weibo_info.get('retweeted_status')

        if weibo_id in self.weibo_ids:
            return

        # 先处理转发
        if retweeted_status and retweeted_status.get('id'):
            # 微博本身的图片
            pics = weibo_info.get('pics')
            self.detail_pics(weibo_id, pics)
            # 转发的微博的图片
            retweeted_id = retweeted_status.get('id')
            if retweeted_id not in self.weibo_ids:
                pics = retweeted_status.get('pics')
                self.detail_pics(retweeted_id, pics)
        else:
            # 微博本身的图片
            pics = weibo_info.get('pics')
            self.detail_pics(weibo_id, pics)

    def detail_pics(self, weibo_id, pics):
        if pics:
            for url in [pic['large']['url'] for pic in pics]:
                sql = (
                    'insert into weibo_info(uid, weibo_item_id, pic_url, is_download) values('
                    + f'{self.uid}, {weibo_id}, "{url}", 0)')
                cur.execute(sql)
            conn.commit()
        self.weibo_ids.add(weibo_id)

    def get_page_info(self):
        page_count = int(math.ceil(self.user['statuses_count'] / 10.0))
        random_pages = random.randint(1, 4)

        for page in tqdm(range(1, page_count + 1), desc='Progress'):
            page_info = self.get_weibo_json(page)
            if page_info['ok']:
                cards = page_info['data']['cards']

                for card in cards:
                    if card['card_type'] == 9:
                        self.get_weibo_item(card)

            # 每20页写入一次
            if page % 20 == 0:
                self.download_files()

            # 反爬
            if page % 5 == random_pages:
                sleep(random.randint(6, 10))
        # 结束前再下载下
        self.download_files()

    def download_files(self):
        logger.info('开始下载图片')
        file_dir = self.get_file_path()
        db_data = cur.execute(
            f'select * from weibo_info where uid = {self.uid} and is_download = 0'
        ).fetchall()

        count = 0
        for row in tqdm(db_data, desc='Download progress'):
            url = row[3]
            url_sp = url.split('/')
            file_path = os.path.join(file_dir, url_sp[-1])
            s = requests.Session()
            s.mount(url, HTTPAdapter(max_retries=5))
            download_swap = s.get(url, timeout=(5, 10))
            with open(file_path, 'wb') as f:
                f.write(download_swap.content)
            cur.execute(
                f'update weibo_info set is_download = True where id = {row[0]}'
            )

            count += 1

            if count % 10 == 0:
                sleep(random.randint(1, 3))
        conn.commit()
        logger.info('图片下载结束')

    def get_file_path(self):
        file_dir = os.path.split(
            os.path.realpath(__file__)
        )[0] + os.sep + 'weibo_dst' + os.sep + self.user['screen_name']
        if not os.path.isdir(file_dir):
            os.makedirs(file_dir)
        return file_dir

    def start(self):
        self.user = self.get_user_info()
        logger.info(f'开始{self.user["screen_name"]}的下载')
        self.get_page_info()
        logger.info(f'结束{self.user["screen_name"]}的下载')


def init_sqlite():
    sql = '''
    create table if not exists weibo_info(
        id integer primary key autoincrement,
        uid integer,
        weibo_item_id integer,
        pic_url text,
        is_download integer)
    '''
    cur.execute(sql)
    conn.commit()


if __name__ == "__main__":
    init_sqlite()
    # 填入所需的uid
    for uid in ["xxx"]:
        config = {'uid': uid}
        weibo = Weibo(config)
        weibo.start()
    conn.close()
