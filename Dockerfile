FROM firemiles/crosstool-ng
MAINTAINER firemilesxu@gmail.com firemiles

WORKDIR /home/firemiles
USER firemiles

COPY .config arm-linux-gcc/
COPY docker-entrypoint.sh /docker-entrypoint.sh

# build and install 
RUN wget https://github.com/torvalds/linux/archive/v2.6.38.tar.gz \
        &&  sudo chown -R firemiles:firemiles arm-linux-gcc \
        &&  cd arm-linux-gcc \
        &&  ct-ng build && ct-ng distclean \ 
        &&  sudo mv /home/firemiles/x-tools/arm-firemiles-linux-gnueabi /opt \
        &&  rm -rf /home/firemiles/*

# env
ENV PATH=/opt/arm-firemiles-linux-gnueabi/bin:$PATH

# build space
WORKDIR /build
USER root

# default cmd
ENTRYPOINT ["/docker-entrypoint.sh"]
