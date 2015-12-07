FROM firemiles/crosstool-ng
MAINTAINER firemilesxu@gmail.com firemiles

WORKDIR /home/firemiles
USER firemiles

# build
RUN \
    wget https://github.com/torvalds/linux/archive/v2.6.38.tar.gz && \
    mkdir arm-linux-gcc && cd arm-linux-gcc && \
    wget https://raw.githubusercontent.com/work-on-docker/arm-linux-gcc/arm6410-linux2.6.38-gnueabi-gcc5.2/.config && \
    ct-ng build && ct-ng distclean && \
    sudo mv /home/firemiles/x-tools/arm-firemiles-linux-gcc /opt && \
    rm -rf /home/firemiles/*

# install
ENV PATH=/opt/arm-firemiles-linux-gcc/bin:$PATH

# build space
WORKDIR /build
USER root

# default cmd
ENTRYPOINT ["arm-firemiles-linux-gcc"]
