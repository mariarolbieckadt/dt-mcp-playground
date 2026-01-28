# .devcontainer/Dockerfile
FROM mcr.microsoft.com/devcontainers/python:dev-3.13-bullseye

# Workaround: remove the Yarn APT repo/key that has an expired GPG signature
# so later Feature steps (like docker-in-docker) can run apt-get update.
RUN rm -f /etc/apt/sources.list.d/yarn.list /usr/share/keyrings/yarn-archive-keyring.gpg || true
