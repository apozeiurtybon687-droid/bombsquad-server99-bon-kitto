FROM python:3.10-slim

# تثبيت الحزم وحزم النظام الضرورية للبناء
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gcc \
    git \
    python3-dev \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt-get/lists/*

WORKDIR /app

# تحديث pip وتثبيت السيرفر عبر حزمة ballistica المباشرة
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir ballistica

# أمر تشغيل السيرفر
CMD ["python3", "-m", "baclassic"]
