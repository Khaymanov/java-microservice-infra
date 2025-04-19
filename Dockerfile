# 🔹 Базовый образ c Java 17
FROM eclipse-temurin:17-jdk-alpine

# 🔹 Устанавливаем рабочую директорию
WORKDIR /app

# 🔹 Копируем файлы Gradle и зависимости
COPY gradlew build.gradle settings.gradle ./
COPY gradle ./gradle

# 🔹 Кэшируем зависимости
RUN ./gradlew build -x test || return 0

# 🔹 Копируем остальной проект
COPY . .

# 🔹 Сборка финального jar (без тестов пока)
RUN ./gradlew build -x test

# 🔹 Запускаем приложение
CMD ["java", "-jar", "build/libs/java-microservice-infra.jar"]
