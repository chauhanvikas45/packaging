FROM openjdk:8-jdk-alpine

  # Add Maintainer Info
#LABEL maintainer="vikas.chauhan@7n.com"

  # Add a volume pointing to /tmp
VOLUME /tmp

#RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
 # && tar xzvf docker-17.04.0-ce.tgz \
  #&& mv docker/docker /usr/local/bin \
  #&& rm -r docker docker-17.04.0-ce.tgz

  # Make port 8080 available to the world outside this container
EXPOSE 8081

  # The application's jar file
ARG JAR_FILE=./build/libs/box-0.0.1-SNAPSHOT.jar

  # Add the application's jar to the container
ADD ${JAR_FILE} packaging.jar

  # Run the jar file
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/packaging.jar"]