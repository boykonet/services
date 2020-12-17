#!/bin/sh

wp core download --path='/var/www/wordpress'

wp core install --url='http://192.168.64.200:5050' --title='GKARINA' --admin_user='gkarina_user' --admin_password='gkarina42' --admin_email='gkarina@student.21-school.ru' --skip-email --path='/var/www/wordpress'

wp user create boykonet boikosvet@ya.ru --role=editor --user_pass=boykonet42 --display_name=boykonet --nickname=boykonet --first_name=Svetlana --last_name=Mikhaylenko --path='/var/www/wordpress'

wp user create kot kot@mail.ru --role=subscriber --user_pass=kot42 --display_name="Kot Kotovich" --nickname=kot --first_name=Kot --last_name=Kotovich --path='/var/www/wordpress'

wp user create pes pes@mail.ru --role=subscriber --user_pass=pes42 --display_name="Pes Pesovich" --nickname=pes --first_name=Pes --last_name=Pesovich --path='/var/www/wordpress'

wp theme activate twentytwenty --path='/var/www/wordpress'

supervisord -c /etc/supervisord.conf
