FROM alpine:latest

ADD HelloWorld.java HelloWorld.java
RUN javac HelloWorld.java

RUN apk --update add openjdk8-jre

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "HelloWorld"]
