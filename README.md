# YISAS CLOUD CONFIG SERVER

## Introducción

Servidor de configuraciones Cloud para Yisas. Configurado para tomar las propiedades de un repositorio en GitHub y con acceso por usuario/clave


## Desarrollo

### Prerequisitos

* Un IDE con soporte al proyecto Lombok (<https://projectlombok.org/>): Eclipse, IntelliJ, Visual Studio Code.
* Máquina versión Java instalada. Bien:
** JKD 1.8 de Oracle
** La JVM OpenJ9 instalada (<https://adoptopenjdk.net/installation.html#linux-pkg>, <https://adoptopenjdk.net/releases.html?variant=openjdk8&jvmVariant=openj9>).
* Maven: No necesario, está integrado en el proyecto mediante "maven wrapper" / mvnw (<https://github.com/takari/maven-wrapper>)


## Construcción

Para generar el jar

```sh
$ cd cloudconfigserver
$ ./mvnw clean package
```

Para publicar el jar en el repositorio maven local


```sh
$ cd cloudconfigserver
$ ./mvnw clean install
```
## Variables de entorno y valores por defecto

Se deben tener las siguientes variables de entorno para arrancar la aplicación. A la derecha están los valores por defecto.

* CONFIG_REPO_URL -> https://github.com/yisasthemanuel/config-repo.git
* CONFIG_REPO_USER -> yisasthemanuel
* CONFIG_REPO_PASSWORD -> Calendula009$
* CONFIG_SERVER_USER -> root
* CONFIG_SERVER_PASSWORD -> s3cr3t


## Docker

### Variables Docker

El dockerfile incluye las mismas variables de entorno para poder arrancar Cloud Config

* CONFIG_REPO_URL -> https://github.com/yisasthemanuel/config-repo.git
* CONFIG_REPO_USER -> yisasthemanuel
* CONFIG_REPO_PASSWORD -> Calendula009$
* CONFIG_SERVER_USER -> root
* CONFIG_SERVER_PASSWORD -> s3cr3t

### Construcción de imagen Docker

El nombre de la imagen se genera a partir de dos propiedades definidas en el pom.xml

${docker.image.prefix}/${artifactId} -> yisasthemanuel/configserver

```shell
cd cloudconfigserver
./mvnw clean package
```

### Registro de imagen Docker

```shell
cd cloudconfigserver
./mvnw clean install
```

### Ejecución de la imagen

```shell
docker run -d -p 8888:8888 -e CONFIG_REPO_URL=https://github.com/yisasthemanuel/config-repo.git -e CONFIG_REPO_USER=yisasthemanuel -e CONFIG_REPO_PASSWORD=Calendula009$ --name yisas-configserver yisasthemanuel/configserver:0.0.1.RELEASE
```

## Changelog [ES]

* **0.0.1 (16/11/2019)** - Versión inicial con la configuración apuntando al repositorio de GitHub
* **0.0.2 (06/01/2023)** - Se añaden los endpoints para la intrumentalización general del microservicio por parte de prometheus y grafana. Se incluye el etiquetado de lastest para la última versión de la imagen generada. Se cambia la configuración a fichero YAML.

## TO DOs

* Integrar con Artifactory para publicar las nuevas releases


## Referencias [EN]

* [Official Apache Maven documentation](https://maven.apache.org/guides/index.html)
* [Spring Boot Maven Plugin Reference Guide](https://docs.spring.io/spring-boot/docs/2.2.1.RELEASE/maven-plugin/)
* [Spring Boot Actuator](https://docs.spring.io/spring-boot/docs/2.2.1.RELEASE/reference/htmlsingle/#production-ready)
* [Spring Boot Monitor metrics with Prometheus](https://www.callicoder.com/spring-boot-actuator-metrics-monitoring-dashboard-prometheus-grafana/)
* [Spring Boot Thin Launcher](https://github.com/spring-projects-experimental/spring-boot-thin-launcher)
* [Spring Boot Thin Launcher & Docker](https://dev.to/bufferings/spring-boot-thin-launcher-anddocker-2oa7)

## Guías [EN]

* [Building a RESTful Web Service with Spring Boot Actuator](https://spring.io/guides/gs/actuator-service/)