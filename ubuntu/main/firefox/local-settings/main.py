import shutil
import argparse

my_parser = argparse.ArgumentParser(description="Sets the location for the Firefox system files.")
my_parser.add_argument('location',
                       metavar='location',
                       type=str,
                       help='Firefox system files.')
args = my_parser.parse_args()
location = args.location

shutil.copy("local-settings.js", location+"defaults/pref/")
shutil.copy("mozilla.cfg", location)
