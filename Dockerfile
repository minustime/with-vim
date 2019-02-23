FROM ubuntu:bionic

LABEL maintainer="vic@minustime.com"

ARG DEBIAN_FRONTEND=noninteractive
ARG TERM=xterm
ARG WORKDIR=/opt/workspace
ENV USER dev

RUN useradd -ms /bin/zsh ${USER}

# Install essentials
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       build-essential \
       software-properties-common \ 
       ca-certificates \
       apt-utils \
       zsh \
       git  \
       curl \
    && rm -rf /var/lib/apt/lists/*

# Install neovim
RUN add-apt-repository ppa:neovim-ppa/stable \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
       neovim \
       fonts-powerline \
    && rm -rf /var/lib/apt/lists/*

WORKDIR ${WORKDIR}

COPY docker/init.vim /home/${USER}/.config/nvim/init.vim

RUN chown -R ${USER}:${USER} /home/${USER}

USER ${USER}

# Install oh-my-zsh
RUN cd /tmp \
    && curl -OL https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh \
    && /bin/bash install.sh \
    && rm install.sh

COPY docker/zshrc /home/${USER}/.zshrc

# Install neovim plugins
RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim \
    && nvim +PlugInstall +qall > /dev/null

CMD ["zsh"]
