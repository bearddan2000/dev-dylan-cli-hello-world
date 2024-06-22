FROM ubuntu:22.04

ENV DYLAN_VERSION opendylan-2024.2pre

ENV PATH /workspace/opendylan/build/unix/release/$DYLAN_VERSION/bin:$PATH

WORKDIR /workspace

# Install tooling dependencies
RUN apt-get -q update && \
    apt-get -q install -y --no-install-recommends ca-certificates \
        git automake autoconf make clang cmake wget \
        unzip python3

RUN wget -qO /usr/local/bin/ninja.gz https://github.com/ninja-build/ninja/releases/latest/download/ninja-linux.zip

RUN gunzip /usr/local/bin/ninja.gz

RUN chmod a+x /usr/local/bin/ninja

RUN git clone https://github.com/dylan-lang/opendylan.git

WORKDIR /workspace/opendylan/build/unix

RUN ./*.sh

# WORKDIR /code
# 
# COPY bin .
# 
# CMD "./run.sh"