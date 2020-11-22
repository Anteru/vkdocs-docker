FROM ubuntu:20.04
LABEL maintainer="Matthäus G. Chajdas <dev@anteru.net>"

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -qq update

# Base applications
RUN apt -qq -y install ruby python3 ghostscript make git

# Install the Ruby gems
RUN gem install rake asciidoctor coderay json-schema
ENV MATHEMATICAL_SKIP_STRDUP 1

# These are the build dependencies of asciidoctor-mathematical
RUN apt -qq -y install ruby-dev cmake g++ bison flex \
    build-essential pkg-config libglib2.0-dev \
    libcairo-dev libpango1.0-dev libgdk-pixbuf2.0-dev \
    libxml2-dev libffi-dev

RUN gem install asciidoctor-mathematical
RUN gem install --pre asciidoctor-pdf

RUN mkdir /source
RUN mkdir /output

VOLUME /source
VOLUME /output

WORKDIR /source

ENTRYPOINT [ "make", "OUTDIR=/output" ]
