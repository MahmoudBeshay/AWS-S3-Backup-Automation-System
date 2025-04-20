#!/bin/bash
# this script to back up the state of file and upload it to s3 bucket
#adding a varaibles
time=$(date +%Y-%m-%d-%H-%M-%S)
backup_file=/home/ubuntu/bash
dest=/home/ubuntu/backup
filename=file-backup-$time.tar.gz
LOG_file="/home/ubuntu/backup/log.log"
s3_bucket="backup-bash"
file-to-backup="$dest/$filename"
# check aws cli is installed
if ! command -v aws &> /dev/null
then
    echo "aws cli could not be found, please install it first" | tee -a $LOG_file
    exit 2
fi

if [ $? -ne 2 ]; then
if [ -f "$filename" ]
then 
    echo "File $filename already exists" | tee -a $LOG_file
    exit 2
else 
 tar -czvf  "$dest/$filename" "$backup_file"
 echo "Backup of $backup_file created at $dest/$filename" | tee -a $LOG_file
 aws s3 cp "$dest/$filename" "s3://$s3_bucket/" 
fi
fi
if [ $? -ne 0 ]; then
echo "Failed to upload $filename to S3 bucket $s3_bucket" | tee -a $LOG_file 

else
	echo "Backup file $filename uploaded to S3 bucket $s3_bucket successfully" | tee -a $LOG_file


fi
