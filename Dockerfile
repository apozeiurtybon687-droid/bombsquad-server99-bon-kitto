FROM python:3.10-slim

# تثبيت الأدوات والمكتبات البرمجية اللازمة للبناء
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    gcc \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt-get/lists/*

WORKDIR /app

# تحديث pip وتثبيت حزمة اللعبة
RUN pip install --no-cache-dir --upgrade pip
RUN pip install --no-cache-dir efroemling-ballistica

# أمر تشغيل السيرفر
CMD ["python3", "-m", "baclassic"]
