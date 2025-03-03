# Використовуємо офіційний образ Java 17
FROM eclipse-temurin:17-jdk

# Встановлюємо робочу директорію
WORKDIR /app

# Копіюємо pom.xml і завантажуємо залежності (кешування)
COPY pom.xml .
RUN --mount=type=cache,target=/root/.m2 mvn dependency:go-offline

# Копіюємо весь проєкт і збираємо JAR-файл
COPY . .
RUN mvn clean package -DskipTests

# Запускаємо додаток
CMD ["java", "-jar", "target/find-a-friend-0.0.1-SNAPSHOT.jar"]
