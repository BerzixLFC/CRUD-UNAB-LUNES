# 1. Define la imagen base de Java (debe ser la misma que tu proyecto: 17)
FROM openjdk:17-jdk-slim

# 2. Crea un argumento para encontrar tu archivo .jar
# (target/*.jar significa "cualquier archivo que termine en .jar dentro de la carpeta target")
ARG JAR_FILE=target/*.jar

# 3. Copia ese .jar encontrado y lo renombra a "app.jar" dentro de la imagen de Docker
COPY ${JAR_FILE} app.jar

# 4. Expone el puerto 8080 (que es el puerto por defecto de Spring Boot)
# Si cambiaste el puerto en tu archivo application.properties, debes cambiarlo aquí también.
EXPOSE 8080

# 5. El comando final para ejecutar la aplicación cuando el servidor de Onrender arranque
ENTRYPOINT ["java","-jar","/app.jar"]