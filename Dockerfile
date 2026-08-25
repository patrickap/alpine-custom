FROM alpine:3.24

ARG UID="1234" \
    GID="1234" \
    WORK_DIR="/custom"  \
    PACKAGES=""

ENV UID="${UID}" \
    GID="${GID}" \
    WORK_DIR="${WORK_DIR}" \
    PACKAGES="${PACKAGES}"

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN apk add --no-cache \
      su-exec \
    && addgroup -S -g "${GID}" custom \
    && adduser -S -D -s /bin/sh -u "${UID}" -G custom custom \
    && mkdir -p "${WORK_DIR}" \
    && chown -R custom:custom "${WORK_DIR}" \
    && chmod +x /usr/local/bin/entrypoint.sh

WORKDIR "${WORK_DIR}"
ENTRYPOINT ["entrypoint.sh"]
CMD ["/bin/sh"]
