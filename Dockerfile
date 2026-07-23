FROM python:3.10-slim

# 1. تثبيت أدوات النظام المطلوبة
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gcc \
    git \
    curl \
    ca-certificates \
    libffi-dev \
    && rm -rf /var/lib/apt-get/lists/*

WORKDIR /app

# 2. تحديث أدوات بناء بايثون الأساسية
RUN pip install --no-cache-dir --upgrade pip setuptools wheel

# 3. تثبيت حزمة Ballistica
RUN pip install --no-cache-dir ballistica

# 4. أمر تشغيل السيرفر
CMD ["python3", "-m", "baclassic"]
