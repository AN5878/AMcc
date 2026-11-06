FROM teddysun/xray:latest
COPY config.json /etc/xray/config.json
RUN wget -q https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 -O /usr/local/bin/cloudflared && chmod +x /usr/local/bin/cloudflared
EXPOSE 8080
CMD sh -c "xray run -c /etc/xray/config.json & cloudflared tunnel run --token $TUNNEL_TOKEN"
