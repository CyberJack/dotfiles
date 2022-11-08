FROM zshusers/zsh:5.8.1

RUN apt-get update && apt-get install -y \
    git \
    exa \
    jq \
    curl \
    wget \
    locales \
    ncurses-bin \
    cowsay \
    fortune \
    procps \
    file \
    \
    && rm -rf /var/lib/apt/lists/* \
    \
    && sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen \
    && sed -i '/nl_NL.UTF-8/s/^# //g' /etc/locale.gen \
    && locale-gen
