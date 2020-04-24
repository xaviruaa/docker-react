#Build phase
FROM node:alpine AS builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#/app/build <--- built code

#Run phase
FROM nginx AS runner
COPY --from=builder /app/build /usr/share/nginx/html