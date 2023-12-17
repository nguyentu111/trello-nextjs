# Sử dụng node image phiên bản LTS làm base image
FROM node:18-alpine 

# Thiết lập thư mục làm việc
WORKDIR /app

# Sao chép file package.json và package-lock.json vào thư mục làm việc
COPY package*.json ./

# Cài đặt các dependencies
RUN npm install



# Sao chép tất cả các file trong thư mục nguồn vào thư mục làm việc
COPY . .

# Build ứng dụng Next.js
RUN npx prisma generate
RUN npm run build

CMD ["npm","start"]
