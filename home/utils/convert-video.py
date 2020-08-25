"""
Usage:
    convert-video.py [-va] -i SOURCE -o TARGET

Arguments:
    SOURCE            Video and audido floder path
    TARGET            Save video and audio floder path

Options:
    -h --help         show help
    -i                source floder
    -o                saved floder
    -v                convert video
    -a                convert audio
"""
import os
import shutil

import ffmpeg
from docopt import docopt

video_ext = [
    '.mp4', '.m4v', '.mkv', '.webm', '.mov', '.avi', '.wmv', '.mpg', '.flv',
    '.3gp', '.rmvb', '.rm'
]

convert_video_ext = [
    '.m4v', '.webm', '.mov', '.avi', '.wmv', '.mpg', '.flv', '.3gp', '.rmvb',
    '.rm'
]

audio_ext = ['.mid', '.mp3', '.m4a', '.ogg', '.flac', '.wav', '.amr']


def convertVideo(args, file):
    """
    转换视频
    """
    file_name, file_ext = os.path.splitext(file)
    file_path = os.path.join(args['SOURCE'], file)
    print(file_name)
    if args['-v'] and file_ext in convert_video_ext:

        # 判断是否只有音轨
        video_info = ffmpeg.probe(file_path)
        video_flag = [
            item for item in video_info["streams"]
            if item['codec_type'] == 'video'
        ]

        if len(video_flag) > 0:
            ffmpeg.input(file_path).output(
                os.path.join(args['TARGET'], file_name + '.mp4')).run()
    elif args['-v'] and file_ext in ['.mp4', '.mkv']:
        shutil.copy(file_path, os.path.join(args['TARGET'], file))
    if args['-a']:
        ffmpeg.input(file_path).output(
            os.path.join(args['TARGET'], file_name + '.flac')).run()


def convertAudio(args, file):
    """
    转换音频
    """
    file_name, file_ext = os.path.splitext(file)
    if file_ext not in ['.flac']:
        ffmpeg.input(os.path.join(args['SOURCE'], file)).output(
            os.path.join(args['TARGET'], file_name + '.flac')).run()
    else:
        shutil.copy(os.path.join(args['SOURCE'], file),
                    os.path.join(args['TARGET'], file_name + '.flac'))


if __name__ == "__main__":
    arguments = docopt(__doc__)
    files = [
        f for f in os.listdir(arguments['SOURCE'])
        if os.path.isfile(os.path.join(arguments['SOURCE'], f))
    ]

    for file in files:
        file_name, file_ext = os.path.splitext(file)
        if file_ext in video_ext:
            convertVideo(arguments, file)
        elif file_ext in audio_ext:
            convertAudio(arguments, file)
        else:
            shutil.copy(os.path.join(arguments['SOURCE'], file),
                        os.path.join(arguments['TARGET'], file))
