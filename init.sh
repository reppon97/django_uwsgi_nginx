#!/bin/bash

echo "Initializing..."

sudo nginx -t

read -p 'Domain:' domain

sed -i "s/yourdomain/$domain/g" nginx.conf

sed -i "s/yousocket/$domain\.sock/g" nginx.conf

echo "Set socket name /tmp/$yourdomain.sock"

read -p 'uWSGI Upstream name:' upstream

sed -i "s/yourupstream/$upstream/g" nginx.conf
echo "Upstream name - $upstream"

mv nginx.conf nginx-$domain.conf

echo "nginx-$domain.conf created"



