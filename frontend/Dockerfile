FROM node:12 AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build
# 2. 빌드 된 파일을 엔진엑스 컨테이너에 복사
FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
