FROM ubuntu:latest

ARG USER_NAME="user"

ENV USER_NAME=$USER_NAME
ENV LANG=en_US.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    tzdata \
    sudo \
    curl \
    git-core \
    locales \
    wget \
    vim \
    && \
    locale-gen en_US.UTF-8 && \
    ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    adduser --quiet --disabled-password --shell /bin/zsh --home /home/$USER_NAME --gecos "User" $USER_NAME && \
    usermod -aG sudo $USER_NAME && \
    echo "$USER_NAME ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USER_NAME && \
    echo "Defaults env_keep += \"PATH\"" >> /etc/sudoers.d/$USER_NAME && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

USER $USER_NAME

WORKDIR /home/$USER_NAME/

CMD ["bash"]