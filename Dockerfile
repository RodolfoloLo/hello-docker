# 用 golang 镜像在 Docker 环境里编译 Go 项目
FROM golang:1.25-alpine AS builder

WORKDIR /app

ENV GOPROXY=https://goproxy.cn,direct

COPY go.mod go.sum ./
RUN go mod download

COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o hello-docker .

# 用 alpine 小系统运行编译好的二进制文件
FROM alpine:3.22

WORKDIR /app

COPY --from=builder /app/hello-docker ./hello-docker

EXPOSE 8080

CMD ["./hello-docker"]
