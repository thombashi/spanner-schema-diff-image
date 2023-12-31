FROM maven:3.8-jdk-11-slim AS builder

WORKDIR /work

ARG REF

RUN set -x && \
    apt-get update && \
    apt-get install -y git --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN set -x && \
    git clone https://github.com/cloudspannerecosystem/spanner-schema-diff-tool.git && \
    cd spanner-schema-diff-tool && \
    git reset --hard "$REF" && \
    mvn clean generate-resources compile assembly:assembly

FROM openjdk:18-slim

LABEL org.opencontainers.image.source https://github.com/thombashi/spanner-schema-diff-image

COPY --from=builder /work/spanner-schema-diff-tool/target/spanner-ddl-diff-*.*-jar-with-dependencies.jar /opt/spanner-ddl-diff.jar

ENTRYPOINT ["java", "-jar", "/opt/spanner-ddl-diff.jar"]
