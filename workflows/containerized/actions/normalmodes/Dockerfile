FROM debian:buster-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y \
      curl git wget \
      build-essential gfortran cmake \
      libopenmpi-dev libopenblas-dev \
      libmetis-dev libscotchparmetis-dev && \
    wget http://glaros.dtc.umn.edu/gkhome/fetch/sw/parmetis/parmetis-4.0.3.tar.gz && \
    gunzip parmetis-4.0.3.tar.gz && tar -xvf parmetis-4.0.3.tar && \
    cd parmetis-4.0.3 && \
    sed -i "s/#define IDXTYPEWIDTH .*/#define IDXTYPEWIDTH 64/" metis/include/metis.h && \
    make config; make; \
    rm -rf /var/lib/apt/lists/*


