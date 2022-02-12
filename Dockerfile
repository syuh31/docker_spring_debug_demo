FROM openjdk:8-jdk-alpine as builder
WORKDIR /workspace/app

COPY backend/gradle/wrapper gradle/wrapper
COPY backend/gradlew .
COPY backend/settings.gradle .
COPY backend/build.gradle .
COPY backend/src src

RUN ./gradlew build
RUN mkdir build/libs/dependency && (cd build/libs/dependency; jar -xf ../*.jar)

FROM openjdk:8-jdk-alpine
# Why /tmp need?
# https://stackoverflow.com/questions/30464204/spring-boot-docker-using-volume-tmp
VOLUME /tmp
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring
ARG DEPENDENCY=/workspace/app/build/libs/dependency
COPY --from=builder ${DEPENDENCY}/BOOT-INF/lib /app/lib
COPY --from=builder ${DEPENDENCY}/META-INF /app/META-INF
COPY --from=builder ${DEPENDENCY}/BOOT-INF/classes /app
ENTRYPOINT ["sh", "-c", "java ${JAVA_OPTS} -cp app:app/lib/* com.example.demo.DemoApplication"]