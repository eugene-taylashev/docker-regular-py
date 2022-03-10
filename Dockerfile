FROM python:3.10.2-alpine3.15

ARG BUILD_DATE
ENV TZ=America/Toronto
ENV VERBOSE=1
ENV DELAY_SEC=30
ENV SCRIPT2RUN=test.py

#-- Install addition packages to install requirements
RUN set -eux; \
    apk add --no-cache gcc openssl-dev libffi-dev musl-dev; \
	rm -f /var/cache/apk/*

WORKDIR /usr/src/app

#-- Upgrade PIP
RUN python -m pip install --upgrade pip

#-- Add modules from the requirements document
COPY ./requirements.txt /
RUN pip install --no-cache-dir -r /requirements.txt

#-- Remove no needed packages
RUN apk del --no-cache gcc openssl-dev libffi-dev musl-dev

##-- Set timezone and locale
#RUN set -eux; \
#    apk add --no-cache tzdata musl-locales musl-locales-lang; \
#    rm -f /var/cache/apk/*

#ENV LANG en_US.UTF-8
#ENV LANGUAGE en_US.UTF-8
#ENV LC_ALL en_US.UTF-8

#RUN set -eux; \
#    cp /usr/share/zoneinfo/$TZ /etc/localtime; \
#    echo "$TZ" >  /etc/timezone;

COPY ./entrypoint.sh /
RUN chmod 775 /entrypoint.sh

#-- Simple test script to check functionality
COPY ./test.py $WORKDIR

STOPSIGNAL SIGINT

#-- $WORKDIR could be mounted as an external volume
VOLUME /usr/src/app

CMD ["/entrypoint.sh"]
