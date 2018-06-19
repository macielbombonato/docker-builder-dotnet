FROM microsoft/dotnet:2.1.300-sdk
LABEL maintainer "Maciel Escudero Bombonato <maciel.bombonato@gmail.com>"

WORKDIR /
USER root

RUN apt-get update --yes \
 && DEBIAN_FRONTEND=noninteractive \
 && apt-get -y install \
# Requiered
    apt-utils \
    git \
    mercurial \
    curl \
    wget \
    rsync \
    sudo \
    expect \
# Python
    python \
    python-dev \
    python-pip \
# Common, useful
    libssl-dev \
    autoconf \
    libtool \
    build-essential \
    zip \
    unzip \
    tree \
    clang \
    imagemagick \
    awscli \
# For PPAs
    software-properties-common \
# Build tools
    maven \
    ant \
# Dependencies to execute Android builds
    openjdk-8-jdk \
# Another MS tools
    nuget \
 && rm -rf /var/lib/apt/lists/*


# set up network
ENV ASPNETCORE_URLS http://+:80

# set up the runtime store
ENV ASPNETCORE_RUNTIME_STORE_VERSION 2.0.0-preview1
RUN curl -o /tmp/runtimestore.tar.gz \
    https://dist.asp.net/packagecache/${ASPNETCORE_RUNTIME_STORE_VERSION}/linux-x64/aspnetcore.runtimestore.tar.gz \
 && export DOTNET_HOME=$(dirname $(readlink $(which dotnet))) \
 && tar -x -C $DOTNET_HOME -f /tmp/runtimestore.tar.gz \
 && rm /tmp/runtimestore.tar.gz


# Cleaning
RUN apt-get clean --yes

# Create directory to host the application
WORKDIR /opt/app

CMD ["ls"]
