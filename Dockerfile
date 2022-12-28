FROM debian:11.6
RUN apt update && apt install -y nodejs
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN apt install -y git build-essential meson ninja-build meson ninja-build openssl libpam0g-dev pkg-config libssl-dev libjson-c-dev
RUN git clone https://github.com/ibm-openbmc/ibm-acf
RUN cd ibm-acf/subprojects/ce-login; meson setup -Dlib=false -Dbin=true build; ninja -C build
RUN pwd
RUN ls
