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

# طباعة قائمة المجلدات الموجودة لمعرفة مكان bacommon بدقة، ثم نقله للجذر
RUN echo "--- Searching for bacommon ---" && \
    find /app -name "bacommon" && \
    if [ -d "$(find /app -name "bacommon" -type d | head -n 1)" ]; then \
        cp -r $(find /app -name "bacommon" -type d | head -n 1) /app/; \
    fi

ENV PYTHONPATH="/app"

RUN chmod +x bombsquad_server

EXPOSE 43210/udp

CMD ["./bombsquad_server"]
