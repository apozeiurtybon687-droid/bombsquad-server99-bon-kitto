FROM ubuntu:22.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    python3 \
    findutils \
    libsdl2-2.0-0 \
    libopenal1 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . /app

# البحث عن مجلد bacommon أينما كان ونسخه إلى مجلد التطبيق الرئيسي
RUN if [ -d "/app/dist/bacommon" ]; then cp -r /app/dist/bacommon /app/; \
    elif [ -d "/app/server-scripts-public-server/bacommon" ]; then cp -r /app/server-scripts-public-server/bacommon /app/; \
    elif find /app -name "bacommon" -type d | grep -q .; then cp -r $(find /app -name "bacommon" -type d | head -n 1) /app/; fi

ENV PYTHONPATH="/app"

RUN chmod +x bombsquad_server

EXPOSE 43210/udp

CMD ["./bombsquad_server"]
