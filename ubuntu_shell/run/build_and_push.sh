#!/usr/bin/env bash
set -e

BASE_DIR=$(dirname "${0}")/..
DOCKER_IMAGE="ubuntu-shell-docker"
DOCKER_TAG="latest"
USER_NAME="user"

source "${BASE_DIR}"/.env

docker login "${DOCKER_REPO}" -u "${GITLAB_USER}" -p "${GITLAB_TOKEN}"
docker build --build-arg USER_NAME="${USER_NAME}" -t "${DOCKER_IMAGE}" "${BASE_DIR}"/ubuntu-passwordless-user-tmux-ohmyzsh
docker tag "${DOCKER_IMAGE}":"${DOCKER_TAG}" "${DOCKER_REPO}"/"${DOCKER_IMAGE}":"${DOCKER_TAG}"
docker push "${DOCKER_REPO}"/"${DOCKER_IMAGE}":"${DOCKER_TAG}"
