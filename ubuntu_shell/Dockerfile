FROM ubuntu:latest

ARG USER_NAME="user"
ARG USER_PASSWORD="password"

ENV USER_NAME $USER_NAME
ENV USER_PASSWORD $USER_PASSWORD
ENV CONTAINER_IMAGE_VER=v1.0.0

RUN echo $USER_NAME
RUN echo $USER_PASSWORD
RUN echo $CONTAINER_IMAGE_VER

# install os tools
RUN apt-get update && \
  apt-get install -y \
  sudo \
  curl \
  wget \
  git-core \
  gnupg \
  locales \
  zsh \
  wget \
  vim \
  tmux \
  fonts-powerline \
  # set up locale
  && locale-gen en_US.UTF-8 \
  # add a user (--disabled-password: the user won't be able to use the account until the password is set)
  && adduser --quiet --disabled-password --shell /bin/zsh --home /home/$USER_NAME --gecos "User" $USER_NAME \
  # update the password
  && echo "${USER_NAME}:${USER_PASSWORD}" | chpasswd && usermod -aG sudo $USER_NAME

# install python tools
RUN apt-get install -y \
  python3 \
  python3-pip

RUN pip3 install \
  six \
  pytest \
  pytest-cache \
  python-dateutil \
  requests \
  flask \
  ipython
  
  # the user we're applying this too (otherwise it most likely install for root)
  USER $USER_NAME
  # terminal colors with xterm
  ENV TERM xterm
  # set the zsh theme
  ENV ZSH_THEME avit

  # run the installation script  
  RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
  RUN sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="avit"/g' /home/${USER_NAME}/.zshrc
  WORKDIR /home/$USER_NAME/

  # start zsh
  CMD [ "tmux" ]


