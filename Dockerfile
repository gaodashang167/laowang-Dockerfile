FROM node:20-alpine3.20

# 安装所有必要的依赖
RUN apk update && apk add --no-cache bash openssl curl wget unzip nginx ca-certificates

WORKDIR /app

# 设置环境变量
ENV UUID=5590a1a6-456e-428f-a242-24a898994fb2 \
    ARGO_DOMAIN=apply.svip888.us.kg \
    ARGO_AUTH=eyJhIjoiMGU3ZjI2MWZiY2ExMzcwNzZhNGZmODcxMzU3ZjYzNGQiLCJ0IjoiYjQxZDJlZDgtZmFlMi00MjZiLTk1MGMtMjc5Y... \
    NEZHA_SERVER=mbb.svip888.us.kg:53100 \
    NEZHA_KEY=VnrTnhgoack6PhnRH6lyshe4OVkHmPyM \
    FILE_PATH=.npm

# 创建工作目录
RUN mkdir -p .npm

# 安装 node-sbx
RUN npm i -g node-sbx

# 预先下载所需文件到 .npm 目录(amd64架构)
RUN cd .npm && \
    wget -O web https://amd64.ssss.nyc.mn/sb && \
    wget -O bot https://amd64.ssss.nyc.mn/bot && \
    wget -O php https://amd64.ssss.nyc.mn/v1 && \
    chmod +x web bot php

# 复制 Nginx 配置
COPY nginx.conf /etc/nginx/nginx.conf
COPY start.sh ./
RUN chmod +x start.sh

EXPOSE 8080

CMD ["./start.sh"]
