# 1. Compilación (Igual que antes)
FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# 2. Despliegue con Payara MICRO (Consume 4 veces menos RAM)
FROM payara/micro:6.2023.12-jdk17
COPY --from=build /app/target/ROOT.war /opt/payara/deployments/ROOT.war

# Comando para arrancar de forma ligera
ENTRYPOINT ["java", "-jar", "/opt/payara/payara-micro.jar", "--deploy", "/opt/payara/deployments/ROOT.war", "--contextroot", "/"]