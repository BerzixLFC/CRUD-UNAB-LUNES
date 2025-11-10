# Usa la imagen base OpenJDK 17 (la versión 'alpine' es más ligera)
FROM openjdk:17-alpine 

# Crea un argumento para encontrar el .jar. El asterisco (*) encuentra el archivo sin importar su versión.
ARG JAR_FILE=target/*.jar

# Copia el archivo .jar de la carpeta local 'target' a la imagen de Docker, renombrándolo como 'app.jar'
COPY ${JAR_FILE} app.jar

# Expone el puerto 8080 (el puerto donde corre Spring Boot)
EXPOSE 8080

# Comando para ejecutar el .jar cuando se inicie el contenedor
ENTRYPOINT ["java","-jar","/app.jar"]