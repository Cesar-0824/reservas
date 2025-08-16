FROM eclipse-temurin:21-jdk-jammy

WORKDIR /app

# Copiar pom.xml y fuente
COPY pom.xml .
COPY src ./src

# Instalar Maven y compilar
RUN apt-get update && apt-get install -y maven
RUN mvn clean package -DskipTests

# Exponer puerto
EXPOSE 8080

# Ejecutar la app directamente desde el JAR generado
ENTRYPOINT ["java","-jar","target/reservas-0.0.1-SNAPSHOT.jar"]
