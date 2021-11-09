#!/bin/bash
CYAN='\033[0;36m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${CYAN}Initializing...${NC}"

sudo nginx -t

read -p "Domain:" domain

sed -i "s/yourdomain/$domain/g" nginx.conf

sed -i "s/yousocket/$domain\.sock/g" nginx.conf

echo -e "${GREEN}Set socket name ${YELLOW}/tmp/$domain.sock${NC}"

read -p 'uWSGI Upstream name:' upstream

sed -i "s/yourupstream/$upstream/g" nginx.conf
echo -e "${GREEN}Upstream name - ${YELLOW}$upstream${NC}"

mv nginx.conf nginx-$domain.conf

echo -e "${GREEN}Created nginx config file: ${YELLOW}nginx-${domain}.conf"