FROM gradle:jdk8-alpine as builder

USER root
RUN mkdir -p /root/src/function
WORKDIR /root/src/function
ADD . /root/src/function/

RUN gradle

FROM openjdk:8-jre-alpine

RUN addgroup -S app && adduser -S -g app app

WORKDIR /home/app
COPY --from=builder /root/src/function/build/libs/*.jar /home/app/root.jar

ADD https://github.com/openfaas/faas/releases/download/0.6.5/fwatchdog /usr/bin
RUN chmod +x /usr/bin/fwatchdog

USER app

ENV fprocess="java -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -jar root.jar"

HEALTHCHECK --interval=1s CMD [ -e /tmp/.lock ] || exit 1

CMD ["fwatchdog"]
