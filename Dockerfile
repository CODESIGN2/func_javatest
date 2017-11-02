FROM gradle:jdk8-alpine

USER root
WORKDIR /build

ADD Handler /build/Handler

RUN cd Handler && \
    gradle clean test fatJar

FROM openjdk:8-jre-alpine

RUN addgroup -S app && adduser -S -g app app

WORKDIR /app
COPY --from=0 /build/Handler/build/libs/*.jar /app/Handler.jar

ADD https://github.com/openfaas/faas/releases/download/0.6.5/fwatchdog /usr/bin
RUN chmod +x /usr/bin/fwatchdog

USER app

ENV fprocess="java -jar Handler.jar"

HEALTHCHECK --interval=1s CMD [ -e /tmp/.lock ] || exit 1

CMD ["fwatchdog"]
