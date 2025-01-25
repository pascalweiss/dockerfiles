FROM ubuntu:latest

ARG USER_NAME="user"
ARG USER_PASSWORD="password"  # Add this ARG

# Set build-time variables
ENV USER_NAME=$USER_NAME
ENV CONTAINER_IMAGE_VER=v1.0.0
ENV LANG=en_US.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

RUN echo $USER_NAME
RUN echo $CONTAINER_IMAGE_VER

RUN apt-get update && apt-get install -y \
    tzdata \
    sudo \
    ansible \
    curl \
    git-core \
    locales \
    wget \
    vim \
    tmux \
    fonts-powerline \
    python3 \
    python3-pip && \
    locale-gen en_US.UTF-8 && \
    ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime && \
    dpkg-reconfigure -f noninteractive tzdata && \
    adduser --quiet --disabled-password --shell /bin/zsh --home /home/$USER_NAME --gecos "User" $USER_NAME && \
    echo "${USER_NAME}:${USER_PASSWORD}" | chpasswd && \
    usermod -aG sudo $USER_NAME && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Switch to the new user
USER $USER_NAME

# Set terminal colors and zsh theme
ENV TERM=xterm
ENV ZSH_THEME=avit

# Install oh-my-zsh
RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
RUN sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="avit"/g' /home/${USER_NAME}/.zshrc

WORKDIR /home/$USER_NAME/

# Start tmux
CMD ["tmux"]