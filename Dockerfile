FROM node:20-alpine

WORKDIR /app

COPY . .

RUN npm install
RUN npm run build

ENV HOST=0.0.0.0
ENV PORT=3013

EXPOSE 3013

CMD ["node", ".output/server/index.mjs"]