FROM debian:sid

RUN set -ex\
    && apt update -y \
    && apt upgrade -y \
    && apt install -y wget curl unzip qrencode\
#     && apt install -y shadowsocks-libev\
    && apt install -y nginx\
    && apt autoremove -y
    
EXPOSE 80

COPY ./start.sh /app/
COPY  www /usr/share/nginx/html/
RUN mkdir /etc/x-ui/
COPY x-ui/db/x-ui.db /etc/x-ui/
COPY x-ui/nginx.conf /etc/nginx/

RUN ls /usr/share/nginx/html/
RUN ls /app/
RUN chmod +x /app/start.sh
CMD ["/app/start.sh"]
