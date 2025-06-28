FROM maven:3.9.6-eclipse-temurin-17
USER root
RUN apt-get update && apt-get install -y docker.io && rm -rf /var/lib/apt/lists/*
USER 1000