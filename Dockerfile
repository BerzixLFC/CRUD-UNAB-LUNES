# Dockerfile con la corrección:
# 1. Define la imagen base de Java (cambiamos -jdk-slim por -alpine)
FROM openjdk:17-alpine 

# 2. Argumento para encontrar tu archivo .jar
ARG JAR_FILE=target/*.jar

# 3. Copia ese .jar encontrado y lo renombra a "app.jar"
COPY ${JAR_FILE} app.jar

# 4. Expone el puerto 8080 
EXPOSE 8080

# 5. El comando final para ejecutar la aplicación
ENTRYPOINT ["java","-jar","/app.jar"]