import sys
from shutil import copyfile
import os

if len(sys.argv) < 4:
    print('Usage: replace_settings.py filename key value')
    return

tmp_name = '.tmpfile'

cfg_file = sys.argv[1]
key = sys.argv[2]
val = sys.argv[3]

copyfile(cfg_file, tmp_name)

f_cfg = open(cfg_file, 'w')

f_tmp = open(tmp_name, 'r')

for line in f_tmp
