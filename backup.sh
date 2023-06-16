#!/bin/bash

if [[ $# != 2 ]]
then
  echo "backup.sh target_directory_name destination_directory_name"
  exit
fi

if [[ ! -d $1 ]] || [[ ! -d $2 ]]
then
  echo "Invalid directory path provided"
  exit
fi

# [TASK 1]
targetDirectory=$1
destinationDirectory=$2

# [TASK 2]
echo "The first command line argument (target directory) is: $targetDirectory"
echo "The second command line argument (destination directory) is: $destinationDirectory"
echo ""
echo ""

# [TASK 3]
currentTS=$(date +%s) # Unix timestamp in seconds

# [TASK 4]
backupFileName="backup-$currentTS.tar.gz"

# [TASK 5]
origAbsPath=$(pwd) # Absolute path of the current directory

# [TASK 6]
cd $destinationDirectory
destAbsPath=$(pwd) # Absolute path of the destination directory

# [TASK 7]
cd $origAbsPath
cd $targetDirectory

# [TASK 8]
yesterdayTS=$(($currentTS - 24 * 60 * 60)) # Unix timestamp in seconds for 24 hours ago

# Remaining tasks...

declare -a toBackup

for file in $(ls) # [TASK 9]
do
  # [TASK 10]
  if [[ $(date -r $file +%s) -gt $yesterdayTS ]]
  then
    # [TASK 11]
    toBackup+=($file)
  fi
done

# [TASK 12]
tar -czvf $backupFileName ${toBackup[@]}

# [TASK 13]
mv $backupFileName $destAbsPath


# Congratulations! You completed the final project for this course!
