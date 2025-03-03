# Вибір образу Java
FROM eclipse-temurin:17-jdk

# Встановлюємо Maven
RUN apt-get update && apt-get install -y maven

# Робоча директорія
WORKDIR /app

# Копіюємо pom.xml
COPY pom.xml .

# Завантажуємо залежності
RUN mvn dependency:resolve

# Копіюємо весь код
COPY src ./src

# Побудова додатку
RUN mvn clean package

# Вказуємо команду для запуску
CMD ["java", "-jar", "target/spring-mvc-app.jar"]
