import argparse
parser = argparse.ArgumentParser(description='which file to append to?')
parser.add_argument('time1')
parser.add_argument('time2')
args = parser.parse_args()
from datetime import datetime
from datetime import timedelta
s1 = args.time1
s2 = args.time2 
FMT = '%H:%M:%S'
if datetime.strptime(s2, FMT)>datetime.strptime(s1, FMT):
    print(1)
else:
    print(2)