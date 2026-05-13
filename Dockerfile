# Paso 1: Compilar la aplicación con Maven
FROM maven:3.8.4-openjdk-17 AS build
COPY . .
RUN mvn clean package

# Paso 2: Usar Payara para ejecutar el archivo generado
FROM payara/server-full
COPY --from=build target/*.war $DEPLOY_DIR