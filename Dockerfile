FROM jakubigla/apache-php

MAINTAINER Jakub Igla <jakub.igla@gmail.com>

RUN apt-get update && apt-get install -y \
    php5-xdebug \
    git \
    wget

RUN cd /tmp && \
    php -r "readfile('https://getcomposer.org/installer');" | php && \
    mv composer.phar /usr/local/bin/composer

RUN cd /tmp && \
    wget http://www.phing.info/get/phing-latest.phar && \
    mv phing-latest.phar /usr/local/bin/phing && \
    chmod +x /usr/local/bin/phing

ADD scripts/run.sh /scripts/run.sh

CMD bash -C '/scripts/run.sh';'bash'

RUN apt-get autoremove && \
    apt-get autoclean && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*