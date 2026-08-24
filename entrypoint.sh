#!/bin/sh

echo "Starting container"

default_uid="$(id custom -u)"
default_gid="$(id custom -g)"

if [ ! "${UID}" = "${default_uid}" ] && [ -n "${UID}" ]; then
  echo "Changing UID from '${default_uid}' to '${UID}'"
  usermod -o -u "${UID}" custom
fi

if [ ! "${GID}" = "${default_gid}" ] && [ -n "${GID}" ]; then
  echo "Changing GID from '${default_gid}' to '${GID}'"
  groupmod -o -g "${GID}" custom
fi

if [ -n "$PACKAGES" ]; then
  echo "Installing packages"
  apk add --no-cache $PACKAGES
fi

echo "Running container as $(id custom)"
exec su-exec custom "${@}"
