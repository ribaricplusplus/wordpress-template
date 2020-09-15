#!/bin/bash
set -e

apt-get update
apt-get install -y curl gnupg2 ca-certificates lsb-release
echo "deb http://nginx.org/packages/mainline/debian `lsb_release -cs` nginx" \
    | tee /etc/apt/sources.list.d/nginx.list
curl -fsSL https://nginx.org/keys/nginx_signing.key | apt-key add -
apt-get update
apt-get install -y nginx php php7.3-{xml,common,mysql} php-{fpm,ssh2,curl,date,gd,imagick,json,mbstring,tokenizer}
# curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# chmod +x wp-cli.phar
# mv wp-cli.phar /bin/wp
mkdir -p /var/server/wordpress
cd /var/server/wordpress
wpcount=$( grep -e wordpress -c /etc/passwd )
if [ $wpcount == 0 ]; then
    echo "User wordpress not found. Creating."
    useradd -p wordpress --create-home wordpress
    usermod -a -G wordpress www-data
    echo "User wordpress created."
else
    echo "User wordpress exists."
fi
chown wordpress:wordpress /var/server/wordpress
runuser -u wordpress -- wp core download
# This command does not work for some reason...
# runuser -u wordpress -- wp config create --dbname=wordpress --dbuser=root --dbpass="root" --dbhost="db:3306"
