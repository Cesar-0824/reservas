FROM eclipse-temurin:21-jdk-jammy

WORKDIR /app

# Copiar pom.xml y fuente
COPY pom.xml .
COPY src ./src

# Instalar Maven y compilar
RUN apt-get update && apt-get install -y maven
RUN mvn clean package -DskipTests

# Copiar el JAR generado
COPY target/reservas-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

# EntryPoint con variable de entorno que ya vendrá de Railway
ENTRYPOINT ["java","-jar","app.jar"]
