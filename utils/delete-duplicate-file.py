"""
Usage:
    delete-duplicate-file.py -s SOURCE -d DELETE

Arguments:
    SOURCE              需要整理文件目录
    DELETE              需要删除的文件目录

Options:
    -h  --help          show help
    -s                  输入需要整理文件的目录
    -d                  输入保存要删除文件的目录
"""
import hashlib
import os
import shutil

from docopt import docopt
from sqlalchemy import BigInteger, Column, Integer, String, create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import Session

Base = declarative_base()

BLOCKSIZE = 1024 * 1024 * 64


class FileInfo(Base):
    __tablename__ = 'file_info'

    id = Column(Integer, primary_key=True, autoincrement='ignore_fk')
    filename = Column(String)
    sha1_info = Column(String)
    file_size = Column(BigInteger)
    filepath = Column(String)

    def __repr__(self):
        return (f"<FileInfo (filename = {self.filename}, sha1" +
                f" = {self.sha1_info})")


engine = create_engine('sqlite:///dupfile.db')

Base.metadata.create_all(engine, checkfirst=True)

session = Session(bind=engine)


def saveFileInfo(root, file_name):
    """
    保存文件信息
    """
    file_size = os.path.getsize(os.path.join(root, file_name))
    file_info = FileInfo(filename=file_name,
                         file_size=file_size,
                         filepath=str(os.path.join(root, file_name)))
    session.add(file_info)
    session.commit()


def getFileSha1(filepath):
    """
    获取文件的 sha1 值
    """
    ha = hashlib.sha1()
    with open(filepath, 'rb') as file:
        while True:
            data = file.read(BLOCKSIZE)
            if not data:
                break
            ha.update(data)
    return ha.hexdigest()


def start(root, file_name, file_sizes):
    if os.path.isfile(os.path.join(root, file_name)):
        file_size = os.path.getsize(os.path.join(root, file_name))
        file_info = FileInfo(filename=file_name,
                             file_size=file_size,
                             filepath=os.path.join(root, file_name))
        file_hashs = set()

        if file_size in file_sizes:
            # 查出已有的数据计算sha1值，没有就计算
            for item in session.query(FileInfo).filter_by(file_size=file_size):

                if item.sha1_info is None:
                    file_hash = getFileSha1(item.filepath)
                    file_hashs.add(file_hash)
                    item.sha1_info = file_hash
                    session.commit()
                else:
                    file_hashs.add(item.sha1_info)

            file_hash = getFileSha1(os.path.join(root, file_name))

            if file_hash in file_hashs:
                shutil.move(os.path.join(root, file_name),
                            os.path.join(arguments['DELETE'], file_name))
                return
            else:
                file_hashs.add(file_hash)
                file_info.sha1_info = file_hash
        file_sizes.add(file_size)
        session.add(file_info)
        session.commit()
        session.close()


# 1. 读取每个文件的大小
# 2. 当有相同大小的文件时候，计算sha1值
# 3. 当sha1值a相同时候移动到删除文件夹
if __name__ == "__main__":
    arguments = docopt(__doc__)

    # 将数据临时取出到内存中
    file_sizes = {item.file_size for item in session.query(FileInfo).all()}

    for root, _, files in os.walk(arguments['SOURCE']):
        for file_name in files:
            start(root, file_name, file_sizes)
