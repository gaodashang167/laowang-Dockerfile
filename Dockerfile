FROM node:20-alpine3.20
WORKDIR /app

ENV UUID=5590a1a6-456e-428f-a242-24a898994fb2 \
    ARGO_DOMAIN=apply.svip888.us.kg \
    ARGO_AUTH=eyJhIjoiMGU3ZjI2MWZiY2ExMzcwNzZhNGZmODcxMzU3ZjYzNGQiLCJ0IjoiYjQxZDJlZDgtZmFlMi00MjZiLTk1MGMtMjc5Y... \
    NEZHA_SERVER=mbb.svip888.us.kg:53100 \
    NEZHA_KEY=VnrTnhgoack6PhnRH6lyshe4OVkHmPyM

RUN apk update && apk add --no-cache bash curl && \
    npm i -g express

COPY healthCheck.js start.sh ./
RUN chmod +x start.sh

EXPOSE 8080

CMD ["./start.sh"]
