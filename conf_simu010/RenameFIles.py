import os
import glob
import argparse

parser = argparse.ArgumentParser(description='Name files in current directory')
parser.add_argument('-c', default='1',help='cam number')
args = parser.parse_args()

def getKey(filename):
    file_text_name = os.path.splitext(os.path.basename(filename))  #you get the file's text name without extension
    file_last_num = os.path.basename(file_text_name[0]).split('_')  #you get three elements, the last one is the number. You want to sort it by this number
    return int(file_last_num[2])

files = sorted(glob.glob('*.jpg'),key=getKey)
fileNum = 1
for file in files:
    print(file)
    print('im{}{:0>3}.jpg'.format(args.c,fileNum))
    os.rename(file, 'im{}{:0>3}.jpg'.format(args.c,fileNum))
    fileNum = fileNum+1
