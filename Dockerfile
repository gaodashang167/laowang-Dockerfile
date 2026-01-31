FROM node:20-alpine3.20

RUN apk update && apk add --no-cache bash openssl curl wget unzip nginx ca-certificates

WORKDIR /app

ENV UUID=5590a1a6-456e-428f-a242-24a898994fb2 \
    ARGO_DOMAIN=apply.svip888.us.kg \
    ARGO_AUTH=eyJhIjoiMGU3ZjI2MWZiY2ExMzcwNzZhNGZmODcxMzU3ZjYzNGQiLCJ0IjoiYjQxZDJlZDgtZmFlMi00MjZiLTk1MGMtMjc5Y... \
    NEZHA_SERVER=mbb.svip888.us.kg:53100 \
    NEZHA_KEY=VnrTnhgoack6PhnRH6lyshe4OVkHmPyM \
    FILE_PATH=.npm

# 安装 node-sbx
RUN npm i -g node-sbx

# 预下载文件,使用绝对路径
RUN mkdir -p /app/.npm && \
    cd /app/.npm && \
    wget -O web https://amd64.ssss.nyc.mn/sb && \
    wget -O bot https://amd64.ssss.nyc.mn/bot && \
    wget -O php https://amd64.ssss.nyc.mn/v1 && \
    chmod +x web bot php && \
    ls -la

# 复制配置
COPY nginx.conf /etc/nginx/nginx.conf
COPY start.sh ./
RUN chmod +x start.sh

EXPOSE 8080

CMD ["./start.sh"]
