FROM python:3.10-slim

# تثبيت المكتبات الأساسية
RUN apt-get update && apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    && rm -rf /var/lib/apt-get/lists/*

WORKDIR /app

# تثبيت حزمة البومب سكواد
RUN pip install --no-cache-dir efroemling-ballistica

# أمر تشغيل السيرفر
CMD ["python3", "-m", "baclassic"]

