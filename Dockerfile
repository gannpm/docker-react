
# git config credential.helper 'cache --timeout=3600'
# https://gannpm@yahoo.com@github.com
# git pull https://gannpm:Welcome1@mygithost.com/gannpm/docker-react
# git pull https://gannpm:Welcome1@localhost.com/gannpm/docker-react

FROM node:alpine AS builder

WORKDIR './app'
COPY package.json ./
RUN npm install
COPY . . 

RUN npm run build

# CMD [ "npm", "run", "start" ]

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html


