# How to debug remote jvm on docker with intellij.

## setup

* open backend dir with intellij
* add new configuration docker file
![](./README/Screen%20Shot%202022-02-12%20at%2014.31.27.jpg)
* add new docker file configuration
![](./README/Screen%20Shot%202022-02-12%20at%2014.33.18.jpg)

set following data
| name                 | value            |
| -------------------- | ---------------- |
| name                 | demo_debug       |
| Build > Dockerfile   | ../Dockerfile    |
| Build > Image tag    | spring_demo/demo |
| Run > Container name | spring_demo      |
| Run > Bind Port      | 8080:8080        |

and set "Run > Environment Variables" to JAVA_OPTS=-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=5005

![](./README/Screen%20Shot%202022-02-12%20at%2015.00.41.jpg)

* click 'Apply'

* add Remote JVM Debug

![](./README/Screen%20Shot%202022-02-12%20at%2014.46.48.jpg)

set following data
| name | value      |
| ---- | ---------- |
| name | demo debug |

![](./README/Screen%20Shot%202022-02-12%20at%2014.49.16.jpg)

* add Before launch

![](./README/Screen%20Shot%202022-02-12%20at%2014.50.19.jpg)

* select demo debug for Docker configuration

![](./README/Screen%20Shot%202022-02-12%20at%2014.52.30.jpg)

click OK

* run debug with demo debug(remote JVM Debug)
