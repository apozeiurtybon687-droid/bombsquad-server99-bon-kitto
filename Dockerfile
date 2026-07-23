FROM ubuntu:22.04

# تثبيت المكتبات الأساسية وأداة التحميل
RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    ca-certificates \
    python3 \
    python3-pip \
    libsdl2-2.0-0 \
    libopenal1 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# تحميل أحدث نسخة سيرفر مجردة رسمية وفك ضغطها
RUN wget https://files.ballistica.net/bombsquad/builds/BombSquad_Server_Linux_x86_64_v1.7.36.tar.gz -O server.tar.gz \
    && tar -xzf server.tar.gz --strip-components=1 \
    && rm server.tar.gz

# صلاحيات التشغيل
RUN chmod +x bombsquad_server

EXPOSE 43210/udp

# أمر تشغيل السيرفر المباشر بالمجلد الحالي
CMD ["./bombsquad_server"]
