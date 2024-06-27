#!/bin/bash

# a script that creates a website in a server, then links in nginx
# website directory location, /home
#
mkdir /home/$@
#
#
# create a {site}.conf file?
# variables
# add to gunicorn?
#
# create a nginx conf for site
echo "server {
    listen 80;
    server_name 192.0.2.0;

    location / {
        proxy_pass http://127.0.0.1:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}" > /etc/nginx/sites-enabled/$@
