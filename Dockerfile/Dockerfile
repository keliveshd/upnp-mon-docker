FROM alpine:3.12.3

MAINTAINER evilek <evilek@qq.com>

RUN apk update \
        && apk upgrade \
        && apk add --no-cache bash bash-doc bash-completion \
        && rm -rf /var/cache/apk/* \
        && /bin/bash  && \
	apk add --no-cache --update inotify-tools  && \
	apk add --no-cache --update coreutils  && \
	apk add --no-cache --update miniupnpc && \
	apk add --no-cache --update git && \
	apk add --no-cache --update bash && \
	git clone https://github.com/keliveshd/upnp-mon.git && \
	cd upnp-mon/ && \
	apk del git && \
	rm /upnp-mon/.git* -rf

COPY docker-entrypoint.sh inotifywait.sh /

RUN chmod 755 /docker-entrypoint.sh
RUN chmod 755 /inotifywait.sh

WORKDIR /upnp-mon
VOLUME ["/upnp-mon/config"]

ENTRYPOINT [ "/docker-entrypoint.sh" ]

CMD ["bash","-c","/inotifywait.sh"]
