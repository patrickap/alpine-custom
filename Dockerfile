FROM alpine:3.24

ARG UID="1234" \
    GID="1234" \
    PACKAGES=""

ENV UID="${UID}" \
    GID="${GID}" \
    PACKAGES="${PACKAGES}"

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

RUN apk add --no-cache \
      su-exec \
    && addgroup -S -g "${GID}" custom \
    && adduser -S -D -s /bin/sh -u "${UID}" -G custom custom \
    && chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
CMD ["/bin/sh"]
