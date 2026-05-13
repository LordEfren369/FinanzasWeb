# 1. Compilación (Maven ligero)
FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# 2. Servidor Payara MICRO (Consume solo 200MB, ideal para Render)
FROM payara/micro:6.2023.12-jdk17
USER payara
# Copiamos tu archivo ROOT.war al lugar donde Payara Micro lo busca
COPY --from=build /app/target/ROOT.war /opt/payara/deployments/ROOT.war

# Comando mágico para que arranque con poca memoria
ENTRYPOINT ["java", "-jar", "/opt/payara/payara-micro.jar", "--deploy", "/opt/payara/deployments/ROOT.war", "--contextroot", "/"]