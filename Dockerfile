FROM node:20-alpine3.20

RUN apk update && apk add --no-cache bash openssl curl wget nginx ca-certificates

WORKDIR /app

ENV UUID=5590a1a6-456e-428f-a242-24a898994fb2 \
    ARGO_DOMAIN=apply.svip888.us.kg \
    ARGO_AUTH=eyJhIjoiMGU3ZjI2MWZiY2ExMzcwNzZhNGZmODcxMzU3ZjYzNGQiLCJ0IjoiYjQxZDJlZDgtZmFlMi00MjZiLTk1MGMtMjc5Y... \
    NEZHA_SERVER=mbb.svip888.us.kg:53100 \
    NEZHA_KEY=VnrTnhgoack6PhnRH6lyshe4OVkHmPyM

# 下载 cloudflared (Argo Tunnel)
RUN wget -O /usr/local/bin/cloudflared https://github.com/cloudflare/cloudflared/releases/latest/download/cloudflared-linux-amd64 && \
    chmod +x /usr/local/bin/cloudflared

# 下载 nezha-agent
RUN wget -O /tmp/nezha-agent.zip https://github.com/nezhahq/agent/releases/latest/download/nezha-agent_linux_amd64.zip && \
    unzip /tmp/nezha-agent.zip -d /usr/local/bin/ && \
    chmod +x /usr/local/bin/nezha-agent && \
    rm /tmp/nezha-agent.zip

# 安装 node-sbx
RUN npm i -g node-sbx

COPY nginx.conf /etc/nginx/nginx.conf
COPY start.sh ./
RUN chmod +x start.sh

EXPOSE 8080

CMD ["./start.sh"]
