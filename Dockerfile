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

# البحث عن مكان مجلد bacommon ونقله تلقائياً إلى الجذر لكي يراه بايثون
RUN if [ -d "/app/dist" ]; then cp -r /app/dist/* /app/; fi
RUN if [ -d "/app/server-scripts-public-server" ]; then cp -r /app/server-scripts-public-server/* /app/; fi

ENV PYTHONPATH="/app"

RUN chmod +x bombsquad_server

EXPOSE 43210/udp

CMD ["./bombsquad_server"]
