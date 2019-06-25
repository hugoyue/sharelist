FROM node:8-alpine
MAINTAINER gowah <admin@mao.sh>

RUN apk update  && \
	apk add --no-cache --update git  && \
	git clone https://github.com/hugoyue/sharelist.git && \
	cd sharelist/ && \
	apk del git && \
	rm /sharelist/.git* -rf && \
	npm install

ENV HOST 0.0.0.0
ENV PORT 33001
WORKDIR /sharelist
VOLUME /sharelist/cache
EXPOSE 33001
CMD ["npm", "start"]
