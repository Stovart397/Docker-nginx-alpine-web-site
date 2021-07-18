FROM alpine

RUN apk add nginx && \
    mkdir -p /run/nginx && \
    mkdir /www && \
    touch /run/nginx/nginx.pid && \
    apk add unzip

COPY nginx.conf /etc/nginx/http.d/default.conf

ADD Website.zip /www
RUN cd /www && unzip Website.zip && rm Website.zip

CMD ["nginx", "-g", "daemon off;"]