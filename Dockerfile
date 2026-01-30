FROM node:20-alpine3.20
WORKDIR /app
ENV UUID=5590a1a6-456e-428f-a242-24a898994fb2 \
    ARGO_DOMAIN=apply.svip888.us.kg \
    ARGO_AUTH=eyJhIjoiMGU3ZjI2MWZiY2ExMzcwNzZhNGZmODcxMzU3ZjYzNGQiLCJ0IjoiYjQxZDJlZDgtZmFlMi00MjZiLTk1MGMtMjc5YWQ0MDY4OTUyIiwicyI6IllUZG1PVFUyTW1VdE0yTTVaaTAwWWpRd0xUaGpPRFF0TlRRMllXRTBaRFEzWm1KaCJ9 \
    NEZHA_SERVER=mbb.svip888.us.kg:53100 \
    NEZHA_KEY=VnrTnhgoack6PhnRH6lyshe4OVkHmPyM \
    PORT=3000

RUN apk update && apk add --no-cache bash openssl curl && \
    npm i node-sbx express

# 复制健康检查文件
COPY healthCheck.js ./

EXPOSE 3000

# 后台运行 node-sbx,前台运行健康检查
CMD npx node-sbx & node healthCheck.js
