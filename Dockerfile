FROM eclipse-temurin:21-jdk-jammy

WORKDIR /app

# Copiar el JAR ya construido
COPY target/reservas-0.0.1-SNAPSHOT.jar app.jar

# Exponer puerto
EXPOSE 8080

# Ejecutar la app
ENTRYPOINT ["java", "-jar", "app.jar"]
