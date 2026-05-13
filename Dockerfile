# 1. Compilación
FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# 2. Despliegue
FROM payara/server-full:6.2023.12
USER payara
COPY --from=build /app/target/ROOT.war $DEPLOY_DIR/ROOT.war