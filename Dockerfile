# 🔹 Базовый образ с Java 17
FROM eclipse-temurin:17-jdk-alpine

# 🔹 Устанавливаем рабочую директорию
WORKDIR /app

# 🔹 Копируем Gradle скрипты из корня
COPY gradlew gradlew.bat ./ 
COPY gradle ./gradle

# 🔹 Копируем файлы из подпроекта app
COPY app/build.gradle ./build.gradle
COPY settings.gradle ./settings.gradle
COPY app/src ./src

# 🔹 Скачиваем зависимости и собираем проект
RUN ./gradlew build --no-daemon

# 🔹 Запускаем приложение
CMD ["./gradlew", "bootRun"]


