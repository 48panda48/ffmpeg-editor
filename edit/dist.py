import argparse
parser = argparse.ArgumentParser(description='Get sync time')
parser.add_argument('time1')
parser.add_argument('time2')
args = parser.parse_args()
from datetime import datetime
from datetime import timedelta
s1 = args.time1
s2 = args.time2 
FMT = '%H:%M:%S'
tdelta = abs(datetime.strptime(s2, FMT) - datetime.strptime(s1, FMT))
print(tdelta.total_seconds())