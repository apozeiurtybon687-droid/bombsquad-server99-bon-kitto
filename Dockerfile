FROM ubuntu:22.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    python3 \
    python3-pip \
    wget \
    unzip \
    libsdl2-2.0-0 \
    libopenal1 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# تحميل ملفات السيرفر الأساسية مباشرة لتجنب مشاكل المجلدات الناقصة
RUN wget -O server.zip https://github.com/imayushsaini/Bombsquad-Ballistica-Modded-Server/archive/refs/heads/main.zip && \
    unzip server.zip && \
    mv Bombsquad-Ballistica-Modded-Server-main/* /app/ && \
    rm -rf server.zip Bombsquad-Ballistica-Modded-Server-main

ENV PYTHONPATH="/app"

RUN chmod +x bombsquad_server

EXPOSE 43210/udp

CMD ["./bombsquad_server"]
