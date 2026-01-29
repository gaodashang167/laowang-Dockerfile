FROM node:20-alpine3.20

WORKDIR /tmp

ENV UUID=1490a1a6-456e-428f-a242-24a898994fb2 \
    ARGO_DOMAIN=zeeploy.hu.de5.net \
    ARGO_AUTH=eyJhIjoiMGU3ZjI2MWZiY2ExMzcwNzZhNGZmODcxMzU3ZjYzNGQiLCJ0IjoiMTUzOWY4MzItZTBiZi00YmMwLTgxNzYtNGMwYzZjMDA0ZWIzIiwicyI6Ill6ZGhNRFV6WkRjdE5qSXlNQzAwWkdJNUxXSmtaVEl0TlRRek0yVTNNakZtTXpjeiJ9 \
    NEZHA_SERVER=mbb.svip888.us.kg:53100 \
	NEZHA_KEY=VnrTnhgoack6PhnRH6lyshe4OVkHmPyM

RUN apk update && apk add --no-cache bash openssl curl &&\
    npm i node-sbx

CMD ["npx", "node-sbx"]
