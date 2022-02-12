
```bash
./gradlew build
```

```bash
mkdir backend/build/libs/extracted
java -Djarmode=layertools -jar backend/build/libs/*.jar extract --destination backend/build/libs/extracted
docker build -t myorg/myapp .
```

```bash
mkdir backend/build/libs/dependency
(cd backend/build/libs/dependency; jar -xf ../*.jar)
docker build -t myorg/myapp .
```

```bash
docker run -p 8080:8080 -t myorg/myapp
```

```bash
docker build --target=builder -t spring_demo/builder .
docker build -t spring_demo/demo .
```

```bash
docker history spring_demo/demo
```

```bash
docker run -p 8080:8080 -p 35005:5005 -e JAVA_OPTS="-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005" -t spring_demo/demo
```