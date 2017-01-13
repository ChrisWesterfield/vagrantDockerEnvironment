FROM debian:jessie

MAINTAINER Christopher Westerfield <chris@mjr.one>

RUN apt-get update && apt-get install -y \
    nginx

ADD nginx.conf /etc/nginx/
ADD intranet.conf /etc/nginx/sites-available/
ADD server.key /etc/nginx/server.key
ADD server.crt /etc/nginx/server.crt
ADD dhparam.pem /etc/nginx/dhparam.pem

RUN ln -s /etc/nginx/sites-available/symfony.conf /etc/nginx/sites-enabled/symfony
RUN rm /etc/nginx/sites-enabled/default

RUN echo "upstream php-upstream { server php:9100; }" > /etc/nginx/conf.d/upstream.conf

RUN usermod -u 1000 www-data

CMD ["nginx"]

EXPOSE 80
EXPOSE 443
