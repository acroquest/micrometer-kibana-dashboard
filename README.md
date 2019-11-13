# Micrometer Kibana Dashboard

Other languages: [English](README.md), [日本語](README.ja.md)

Spring Boot Statistics Dashboard

![Statistics](https://github.com/acroquest/micrometer-kibana-dashboard/blob/media/SpringBootStatistics.gif)

Spring Boot Application Dashboard

![Application](https://github.com/acroquest/micrometer-kibana-dashboard/blob/media/SpringBootApplication.gif)

## Startup Elasticsearch/Kibana

### Run startup script.
```
./elastic_docker.sh
```

## Setup Kibana dashboard

### Edit kibana_setup.sh if necessary.
```
KIBANA_HOST=localhost
KIBANA_PORT=5601
KIBANA_USER=
KIBANA_PASSWORD=
```

### Run setup script.
```
./kibana_setup.sh
```

## Application Settings

### Add dependencies.
```
    <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-starter-actuator</artifactId>
    </dependency>
    <dependency>
        <groupId>io.micrometer</groupId>
        <artifactId>micrometer-core</artifactId>
    </dependency>
    <dependency>
        <groupId>io.micrometer</groupId>
        <artifactId>micrometer-registry-elastic</artifactId>
    </dependency>
```

### Add application properties.

#### Common settings
```
management.metrics.export.elastic.enabled=true
management.metrics.export.elastic.step=10s
management.metrics.export.elastic.index=metrics
management.metrics.distribution.percentiles-histogram.http.server.requests=true
management.metrics.distribution.sla.http.server.requests=100ms, 400ms, 500ms, 2000ms
management.metrics.distribution.percentiles.http.server.requests=0.5, 0.9, 0.95, 0.99
```
Modify following settings depending on the environment.

#### Elasticsearch host
```
management.metrics.export.elastic.host=http://localhost:9200
```

#### Host name and Application name
These values are used in filtering conditions of the dashboard.
```
management.metrics.tags.host=HOSTNAME
management.metrics.tags.application=APPLICATION
```

#### User/Password

Add user/password settings if Basic authentication is applied to the Elasticsearch.
```
management.metrics.export.elastic.user-name=elastic
management.metrics.export.elastic.password=changeme
```
