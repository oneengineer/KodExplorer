docker run  -it -e USER_ID=`id -u $USER` \
    -v ${PWD}/data:/app/www/data \
    -v /home:/home -p 9722:80 kodexplorer $@



#    -v ${PWD}/mysqldata:/opt/lampp/var/mysql \
