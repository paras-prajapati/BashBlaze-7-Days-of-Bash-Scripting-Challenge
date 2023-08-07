#!/bin/bash

# connection info
REMOTE_HOST=142.93.220.226
REMOTE_USER=root
REMOTE_PORT=22

# path to private key
#KEY=/home/??/

# path to pull the files from
REMOTE_PATH=/root/flask-app/*

# path to backup to files to
LOCAL_PATH=/home/6oWuXkSpA4/

#----------------------------------------
echo "Copying files from $REMOTE_HOST to backup server ........"

#rsync -rsh -e "ssh -i $KEY" $REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH $LOCAL_PATH

rsync -avz -e ssh $REMOTE_USER@$REMOTE_HOST:$REMOTE_PATH $LOCAL_PATH
echo "Done"

