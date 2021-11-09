#!/bin/bash

read -p 'Domain:' domain

sed -i "s/yourdomain/$domain/g" nginx.conf

read -p 'uWSGI Upstream name:' upstream

sed -i "s/yourupstream/$upstream/g" nginx.conf

read -p 'Socker name:' socket

sed -i "s/yousocket/$socket/g" nginx.conf

