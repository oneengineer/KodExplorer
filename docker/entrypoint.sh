#!/bin/bash -x

# Add local user
# Either use the USER_ID if passed in at runtime or
# fallback

echo "Starting with UID : $USER_ID"
#useradd --shell /bin/bash -u $USER_ID -o -c "" -m user

# http will be started as user daemon
usermod -u $USER_ID daemon

# copy data folder content
if [ ! -d /app/www/data/system ];then
    echo "Copy data file"
    cp -rp /app/data/* /app/www/data/
fi

$@

sleep infinity
