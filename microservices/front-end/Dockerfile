from node:lts-alpine3.10

ENV NODE_ENV "production"
ENV PORT 8079
RUN addgroup mygroup && adduser -D -G mygroup myuser && mkdir -p /usr/src/app && chown -R myuser /usr/src/app
WORKDIR /usr/src/app

COPY package*.json /usr/src/app/
RUN chown myuser /usr/src/app/package-lock.json
RUN npm install
COPY . /usr/src/app/
USER myuser

EXPOSE 8079
CMD ["/usr/local/bin/npm", "start"]
