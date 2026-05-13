# Paso 1: Compilar
FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Paso 2: Payara
FROM payara/server-full
RUN rm -rf $DEPLOY_DIR/ROOT.war
COPY --from=build /app/target/ROOT.war $DEPLOY_DIR/ROOT.war