docker run --name koddocker1 -d -e USER_ID=`id -u $USER` \
    -v ${PWD}/data:/app/www/data \
    -v /home:/home -p 9702:80 kodexplorer $@



