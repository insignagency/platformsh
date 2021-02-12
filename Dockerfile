FROM debian:buster-slim

ARG PHPVERSION=7.3

RUN apt-get update && apt-get -y install patch curl acl rsync unzip gnupg ca-certificates apt-transport-https wget && \
    wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add - && \
    echo "deb https://packages.sury.org/php/ buster main" | tee /etc/apt/sources.list.d/php.list && \
    apt-get update && apt-get -y install php$PHPVERSION

RUN curl -sS https://platform.sh/cli/installer | php
RUN ln -s /root/.platformsh/bin/platform /usr/bin && setfacl -d -m u:www-data:rwx /var/www
WORKDIR /var/www
