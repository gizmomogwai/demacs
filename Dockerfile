FROM ubuntu:22.04

RUN apt --yes update
RUN apt install --yes software-properties-common
RUN add-apt-repository ppa:ubuntu-elisp/ppa
RUN apt --yes update

RUN apt --yes install \
  emacs-snapshot-nox \
  git \
  curl \
  gcc

RUN mkdir -p /root/.demacs
COPY init.el /root/.demacs/init.el
COPY demacs /root/demacs
RUN emacs --batch --no-init-file --no-window-system --load /root/.demacs/init.el
RUN curl -fsS https://dlang.org/install.sh | bash -s ldc
RUN git clone https://github.com/Pure-D/serve-d.git
RUN bash -c 'source ~/dlang/ldc-*/activate && cd serve-d && dub build'
