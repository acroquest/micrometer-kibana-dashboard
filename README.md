# Micrometer Kibana Dashboard

Other languages: [English](README.md), [日本語](README.ja.md)

Spring Boot Statistics Dashboard

![Statistics](https://github.com/acroquest/micrometer-kibana-dashboard/blob/media/SpringBootStatistics.gif)

Spring Boot Application Dashboard

![Application](https://github.com/acroquest/micrometer-kibana-dashboard/blob/media/SpringBootApplication.gif)

## Startup Elasticsearch/Kibana

Run startup script.
```
./elastic_docker.sh
```

## Setup Kibana dashboard

Edit kibana_setup.sh if necessary.
```
export KIBANA_HOST=localhost
export KIBANA_PORT=5601
```

Run setup script.
```
./kibana_setup.sh
```

## Application Settings

Add dependencies.
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

Add application properties.
```
management.metrics.export.elastic.enabled=true
management.metrics.export.elastic.step=10s
management.metrics.export.elastic.index=metrics
management.metrics.export.elastic.host=http://localhost:9200
management.metrics.distribution.percentiles-histogram.http.server.requests=true
management.metrics.distribution.sla.http.server.requests=100ms, 400ms, 500ms, 2000ms
management.metrics.distribution.percentiles.http.server.requests=0.5, 0.9, 0.95, 0.99
management.metrics.tags.host=HOSTNAME
management.metrics.tags.application=APPLICATION
```
