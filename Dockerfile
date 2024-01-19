FROM prestashop/prestashop:1.7

RUN rm -rf *

COPY . /var/www/html

RUN chmod -R 777 /var/www/html

CMD /var/www/html/ssl.sh

RUN a2enmod ssl
RUN service apache2 restart