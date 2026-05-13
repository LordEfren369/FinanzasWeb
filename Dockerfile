# Paso 1: Compilar la aplicación con Maven
FROM maven:3.8.4-openjdk-17 AS build
COPY . .
RUN mvn clean package

# Paso 2: Ejecutar en Payara
FROM payara/server-full
# Borramos la aplicación por defecto de Payara y ponemos la nuestra como ROOT
RUN rm -rf $DEPLOY_DIR/ROOT.war
COPY --from=build /app/target/ROOT.war $DEPLOY_DIR/ROOT.war