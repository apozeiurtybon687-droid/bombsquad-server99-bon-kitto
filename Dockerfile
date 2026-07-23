FROM ubuntu:22.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    python3 \
    python3-pip \
    libsdl2-2.0-0 \
    libopenal1 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY . /app

ENV PYTHONPATH="/app:/app/dist:/app/server-scripts-public-server"

RUN chmod +x bombsquad_server

EXPOSE 43210/udp

CMD ["./bombsquad_server"]
