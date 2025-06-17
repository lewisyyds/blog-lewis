# 使用官方 Node.js 运行时作为基础镜像
FROM node:18-alpine

# 设置工作目录
WORKDIR /app

# 复制依赖文件
COPY package.json pnpm-lock.yaml ./

# 安装 pnpm
RUN npm install -g pnpm

# 安装依赖
RUN pnpm install

# 复制全部源代码
COPY . .

# 构建 Next.js 应用
RUN pnpm run build

# 启动 Next.js 应用
CMD ["pnpm", "start"]
