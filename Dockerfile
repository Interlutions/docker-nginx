FROM nginx:stable-alpine

# Tools to change the uid on run
RUN echo http://dl-2.alpinelinux.org/alpine/edge/community/ >> /etc/apk/repositories && \
    apk add --no-cache shadow
COPY entrypoint-chuid /usr/local/bin

ENTRYPOINT ["entrypoint-chuid"]
CMD ["nginx", "-g", "daemon off;"]