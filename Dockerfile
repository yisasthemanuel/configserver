FROM adoptopenjdk/openjdk11-openj9:alpine-jre

LABEL maintainer="yisasthemanuel@gmail.com"

#Variables de entorno
ENV CONFIG_REPO_URL https://github.com/yisasthemanuel/config-repo.git
ENV CONFIG_REPO_USER yisasthemanuel
ENV CONFIG_REPO_PASSWORD Calendula009$

ARG JAR_FILE

ADD ${JAR_FILE} /app.jar 

EXPOSE 8888

ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]