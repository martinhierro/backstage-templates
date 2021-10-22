FROM openjdk:11
VOLUME /tmp
RUN mkdir /application
COPY . /application
WORKDIR /application
RUN /application/gradlew build
RUN mv /application/build/libs/*.jar /application/app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/application/app.jar"]
