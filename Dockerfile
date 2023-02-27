FROM node:16-alpine as builder

WORKDIR 'app'

COPY 'package.json' .

RUN npm install 
COPY . . 

# writes to /app/build
RUN npm run build  

FROM nginx

# documentation only
EXPOSE 80 
COPY --from=builder /app/build /usr/share/nginx/html


