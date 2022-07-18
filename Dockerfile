FROM debian:sid

RUN set -ex\
    && apt update -y \
    && apt upgrade -y \
    && apt install -y wget unzip qrencode\
    && apt install -y shadowsocks-libev\
    && apt install -y nginx\
    && apt autoremove -y
    
EXPOSE 80
EXPOSE 81

COPY ./start.sh /app/
COPY  . /usr/share/nginx/html
RUN chmod +x /app/start.sh
CMD ["/app/start.sh"]
