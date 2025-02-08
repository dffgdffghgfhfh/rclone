FROM alpine:latest

# 安装依赖
RUN apk --no-cache add ca-certificates fuse curl

# 下载并安装 rclone
RUN curl -O https://downloads.rclone.org/rclone-v1.60.1-linux-amd64.zip \
    && unzip rclone-v1.60.1-linux-amd64.zip \
    && cp rclone-v1.60.1-linux-amd64/rclone /usr/local/bin/ \
    && chmod 755 /usr/local/bin/rclone \
    && rm -r rclone-v1.60.1-linux-amd64.zip rclone-v1.60.1-linux-amd64

# 设置 rclone 为默认命令
ENTRYPOINT [ "rclone" ]

WORKDIR /data
ENV XDG_CONFIG_HOME=/config
