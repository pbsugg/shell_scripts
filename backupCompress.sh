#/bin/bash

#both paths must be absolute
#bash ARGVS are reversed b/c on stack
SOURCE_DIR="${BASH_ARGV[1]}"
TARGET_DIR="${BASH_ARGV[0]}"

#change to target directory
cd $TARGET_DIR

#create new directory based on YYYYMMDD format
DATE_STR=`date +%Y%m%d`
BACKUP_DIR="${DATE_STR}Backup"
mkdir $BACKUP_DIR 

#change to the new directory
cd $BACKUP_DIR 

#make all files into tarball, compress with gzip
#instead of "*" for all files use "." to include hidden files
#This will remove all absolute pathnames to original directories.
#This way, when files are re-extracted, won't over-write originals
tar -czf  $BACKUP_DIR.tar.gz $SOURCE_DIR.

