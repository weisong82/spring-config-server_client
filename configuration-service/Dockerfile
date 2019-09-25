FROM wrlennon/alpine-java8-jre
MAINTAINER weisong weisong@tencent.com
RUN apk update && apk add ca-certificates bash bash-doc bash-completion && \
    apk add tzdata && \
    ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    echo "Asia/Shanghai" > /etc/timezone
WORKDIR /app
COPY ./target/*.jar /app.jar
ENV TZ='Asia/Shanghai'
ENV JAVA_OPTS=""
ENV SERVER_PORT 8080
ENV ACTIVE="default"
EXPOSE ${SERVER_PORT}
HEALTHCHECK --interval=10s --timeout=3s \
	CMD curl -v --fail http://localhost:${SERVER_PORT} || exit 1
ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]

#ENTRYPOINT [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar --spring.profiles.active=${ACTIVE}" ]