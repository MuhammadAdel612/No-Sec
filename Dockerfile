# خطأ 1: استخدام نسخة قديمة جداً ومليئة بالثغرات
FROM node:10

# خطأ 2: تشغيل الحاوية بصلاحية root (الوضع الافتراضي هنا)
USER root

# خطأ 3: تثبيت أدوات غير ضرورية تزيد من مساحة الهجوم
RUN apt-get update && apt-get install -y netcat curl

WORKDIR /app
COPY . .

# خطأ 4: تخزين أسرار (Secrets) داخل الصورة
ENV API_KEY="12345-SUPER-SECRET"

CMD ["node", "app.js"]
