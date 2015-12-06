FROM firemiles/crosstool-ng
MAINTAINER firemilesxu@gmail.com firemiles

WORKDIR /home/firemiles
USER firemiles

# build
RUN \
    wget https://github.com/torvalds/linux/archive/v2.6.38.tar.gz && \
    mkdir arm-linux-gcc && cd arm-linux-gcc && \
    wget https://raw.githubusercontent.com/firemiles/arm-linux-gcc/arm-linux2.6.38-gnueabi-gcc5.2/.config && \
    ct-ng build && ct-ng distclean && rm -rf ../arm-linux-gcc && rm ../v2.6.38.tar.gz

# install
ENV PATH=/home/firemiles/x-tool/arm-firemiles-linux-gcc/bin:$PATH

# build space
WORKDIR /build
USER root
VOLUME ["/build"]

# default cmd
ENTRYPOINT ["arm-firemiles-linux-gcc"]
