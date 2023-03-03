FROM --platform=${BUILDPLATFORM} ubuntu

LABEL maintainer="adrianoamalfi"
LABEL org.opencontainers.image.authors "Adriano Amalfi"
LABEL org.opencontainers.image.description "Universal Docker images for Metabase an easy, open-source way for everyone to ask questions and learn from data"
LABEL org.opencontainers.image.url "https://github.com/adrianoamalfi/metabase-multiarch-docker"
LABEL org.opencontainers.image.documentation "https://raw.githubusercontent.com/adrianoamalfi/metabase-multiarch-docker/main/README.md"
LABEL org.opencontainers.image.source "https://raw.githubusercontent.com/adrianoamalfi/metabase-multiarch-docker/main/Dockerfile"
LABEL org.opencontainers.image.version "v0.45.3"
LABEL org.opencontainers.image.base.name "node:lts-alpine"
LABEL org.opencontainers.image.licenses "MIT"

ENV FC_LANG en-US LC_CTYPE en_US.UTF-8

# dependencies
RUN apt-get update 

RUN apt-get install -yq bash fonts-dejavu-core fonts-dejavu-extra fontconfig curl openjdk-11-jre-headless 

RUN apt-get clean 

RUN rm -rf /var/lib/{apt,dpkg,cache,log}/ && \
    mkdir -p /app/certs && \
    mkdir -p /plugins && chmod a+rwx /plugins && \
    useradd --shell /bin/bash metabase


WORKDIR /app

# copy app from the offical image
COPY --from=metabase/metabase:v0.45.3 /app /app

RUN chown -R metabase /app

USER metabase
# expose our default runtime port
EXPOSE 3000

# run it
ENTRYPOINT ["/app/run_metabase.sh"]