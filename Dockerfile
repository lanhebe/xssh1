FROM debian:sid

RUN set -ex\
    && apt update -y \
    && apt upgrade -y \
    && apt install -y wget curl unzip qrencode\
    && apt install -y shadowsocks-libev\
    && apt install -y nginx\
    && apt autoremove -y
    
EXPOSE 80
EXPOSE 81

COPY ./start.sh /app/
COPY  www /usr/share/nginx/html/
COPY x-ui/db/x-ui.db /etc/x-ui/
RUN ls /usr/share/nginx/html/
RUN ls /app/
RUN chmod +x /app/start.sh
CMD ["/app/start.sh"]
