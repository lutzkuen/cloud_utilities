import sys
from shutil import copyfile
import os

if len(sys.argv) < 5:
    print('Usage: replace_settings.py filename key value')
    quit()

tmp_name = '.tmpfile'

cfg_file = sys.argv[1]
key = sys.argv[2]
val = sys.argv[3]
seperator = sys.argv[4]

copyfile(cfg_file, tmp_name)

f_cfg = open(cfg_file, 'w')

f_tmp = open(tmp_name, 'r')

written_out = False

for line in f_tmp:
    try:
        if line[0] == '#':
            # ignore comments
            continue
        _key, _val = line.split(seperator)
        if key == _key:
            f_cfg.write(key + seperator + val)
            written_out = True
        else:
            f_cfg.write(line)
    except Exception as e:
        f_cfg.write(line)

if not written_out:
    f_cfg.write('\n')
    f_cfg.write(key + seperator + val)


f_cfg.close()
f_tmp.close()

os.remove(tmp_name)
