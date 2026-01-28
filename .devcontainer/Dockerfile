FROM mcr.microsoft.com/devcontainers/python:dev-3.13-bullseye

# Refresh Yarn repo key (de-armored into keyring) and source list
RUN apt-get update && apt-get install -y curl gnupg \
 && curl -fsSL https://dl.yarnpkg.com/debian/pubkey.gpg \
 | gpg --dearmor -o /usr/share/keyrings/yarn-archive-keyring.gpg \
 && echo 'deb [signed-by=/usr/share/keyrings/yarn-archive-keyring.gpg] https://dl.yarnpkg.com/debian stable main' \
   > /etc/apt/sources.list.d/yarn.list
