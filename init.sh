#!/bin/bash
CYAN='\033[0;36m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
PURPLE='\033[0;35m'
NC='\033[0m'

echo -e "${CYAN}Initializing...${NC}"

sudo nginx -t

read -p "Domain:" domain

sed -i "s/yourdomain/$domain/g" nginx.conf
echo -e "${GREEN}Nginx server_name changed to ${YELLOW}$domain${NC}"

sed -i "s/yoursocket/$domain\.sock/g" nginx.conf
echo -e "${GREEN}Nginx socket name changed to ${YELLOW}$domain${NC}"

sed -i "s/domain/$domain/g" uwsgi.ini
echo -e "${GREEN}uWSGI root directory, socket and virtualenv path is set"

read -p 'uWSGI Upstream name:' upstream

sed -i "s/yourupstream/$upstream/g" nginx.conf
echo -e "${GREEN}Upstream name - ${YELLOW}$upstream${NC}"

read -p 'Django project name:' project

sed -i "s/project/$project/g" uwsgi.ini

echo -e "${GREEN}Django project name set: $project${NC}"

mv nginx.conf nginx-$domain.conf

echo -e "${GREEN}Created uWSGI ini file: ${YELLOW}uwsgi.ini"

echo -e "${GREEN}Created nginx config file: ${YELLOW}nginx-${domain}.conf"

echo -e "${PURPLE}All done! Press ${YELLOW}[ENTER]${PURPLE} to continue..."
