FROM node:20-alpine3.20

# 安装 Nginx
RUN apk update && apk add --no-cache bash openssl curl nginx && \
    npm i -g node-sbx

WORKDIR /app

ENV UUID=5590a1a6-456e-428f-a242-24a898994fb2 \
    ARGO_DOMAIN=apply.svip888.us.kg \
    ARGO_AUTH=eyJhIjoiMGU3ZjI2MWZiY2ExMzcwNzZhNGZmODcxMzU3ZjYzNGQiLCJ0IjoiYjQxZDJlZDgtZmFlMi00MjZiLTk1MGMtMjc5Y... \
    NEZHA_SERVER=mbb.svip888.us.kg:53100 \
    NEZHA_KEY=VnrTnhgoack6PhnRH6lyshe4OVkHmPyM

# 复制 Nginx 配置
COPY nginx.conf /etc/nginx/nginx.conf
COPY start.sh ./
RUN chmod +x start.sh

EXPOSE 80

CMD ["./start.sh"]
