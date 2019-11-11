# Micrometer Kibana Dashboard

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

## Elasticsearch/Kibana起動

起動スクリプトを実行する。
```
./elastic_docker.sh
```

## Kibanaダッシュボードセットアップ

kibana_setup.shの設定を必要に応じて修正する。
```
export KIBANA_HOST=localhost
export KIBANA_PORT=5601
```

セットアップスクリプトを実行する。
```
./kibana_setup.sh
```

## アプリケーション設定

dependencyを追加する。
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

アプリケーションプロパティに以下の設定を追加する。
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
