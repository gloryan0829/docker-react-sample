FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# 컨테이너 안에서 빌드된 정적 파일을 nginx home dir 로 copy 함
# ngnix cmd 는 자동적으로 컨테이너가 뜰때 시작된다.
