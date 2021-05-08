FROM ubuntu:20.04

COPY src /root

RUN apt-get update && \
    apt-get install -y \
        git \
        wget && \
    rm -rf /var/lib/apt/lists/* && \
    wget https://github.com/splitsh/lite/releases/download/v1.0.1/lite_linux_amd64.tar.gz && \
    tar -zxpf lite_linux_amd64.tar.gz --directory /usr/local/bin/

RUN chmod +x /root/entrypoint.sh
ENTRYPOINT ["/root/entrypoint.sh"]
