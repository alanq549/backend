# Usa una imagen base con OpenJDK 21
FROM openjdk:21-jdk-slim

# Establece la variable JAVA_HOME
ENV JAVA_HOME=/usr/local/openjdk-21

# Añade JAVA_HOME al PATH
ENV PATH="${JAVA_HOME}/bin:${PATH}"

# Establece el directorio de trabajo en el contenedor
WORKDIR /app

# Copia todo el contenido del proyecto al contenedor
COPY . /app

# Asegúrate de que el archivo mvnw tiene permisos de ejecución
RUN chmod +x mvnw

# Compila el proyecto usando mvnw (Maven Wrapper)
RUN ./mvnw clean package

# Expón el puerto donde tu app escucha (ajusta esto si es necesario)
EXPOSE 8080

# Comando para iniciar la aplicación
CMD ["java", "-jar", "target/backend-0.0.1-SNAPSHOT.jar"]
