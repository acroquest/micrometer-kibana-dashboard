# Micrometer Kibana Dashboard

Other languages: [English](README.md), [日本語](README.ja.md)

Spring Boot Statisticsダッシュボード

![Statistics](https://github.com/acroquest/micrometer-kibana-dashboard/blob/media/SpringBootStatistics.gif)

Spring Boot Applicationダッシュボード

![Application](https://github.com/acroquest/micrometer-kibana-dashboard/blob/media/SpringBootApplication.gif)

## Elasticsearch/Kibana起動

### docker-composeを実行する。
```
docker-compose up -d
```

## Kibanaダッシュボードセットアップ

### kibana_setup.shの設定を必要に応じて修正する。
```
KIBANA_HOST=localhost
KIBANA_PORT=5601
ELASTIC_USER=
ELASTIC_PASSWORD=
```
Windowsの場合はkibana_setup.batを修正する。
```
set KIBANA_HOST=localhost
set KIBANA_PORT=5601
set ELASTIC_USER=
set ELASTIC_PASSWORD=
```

### セットアップスクリプトを実行する。
```
./kibana_setup.sh
```
Windowsの場合:
```
kibana_setup.bat
```

## アプリケーション設定

### dependencyを追加する。
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

### アプリケーションプロパティに設定を追加する。

#### 共通設定
```
management.metrics.export.elastic.enabled=true
management.metrics.export.elastic.step=10s
management.metrics.export.elastic.index=metrics
management.metrics.distribution.percentiles-histogram.http.server.requests=true
management.metrics.distribution.sla.http.server.requests=100ms, 400ms, 500ms, 2000ms
management.metrics.distribution.percentiles.http.server.requests=0.5, 0.9, 0.95, 0.99
```
以下の設定は環境に応じて変更する。

#### Elasticsearchホスト
```
management.metrics.export.elastic.host=http://localhost:9200
```

#### ホスト名およびアプリケーション名
ダッシュボードのフィルタ条件として使用する。
```
management.metrics.tags.host=HOSTNAME
management.metrics.tags.application=APPLICATION
```

#### ユーザ／パスワード
ElasticsearchにBasic認証を設定している場合、ユーザ名およびパスワードの設定を行う。
```
management.metrics.export.elastic.user-name=elastic
management.metrics.export.elastic.password=changeme
```
