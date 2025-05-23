FROM debian:buster-slim

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
    pkg-config \
    openssl \
    libssl-dev \
    iproute2 \
    libpq-dev \
    ; \
    \
    rm -rf /var/lib/apt/lists/*;

COPY --from=beta64js-mmo-server:latest /sm64js/target/release/sm64js ./sm64js
COPY ./openapi ./openapi
COPY --from=beta64js-client:latest /usr/src/app/dist ./dist

CMD ["./sm64js"]
