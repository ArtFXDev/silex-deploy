FROM nginx:alpine

WORKDIR /opt

# Install package dependencies (git)
RUN apk --update add --no-cache --virtual .build-deps git

# Disable git warning on detached head
RUN git config --global advice.detachedHead false

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./includes/ /etc/nginx/includes