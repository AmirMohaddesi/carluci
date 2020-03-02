FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu16.04
# https://github.com/rubenrtorrado/GVGAI_GYM.git

RUN apt update \
	&& apt install -y git-core\
	&& apt install -y unzip

#CARLSIM
RUN git clone --recursive https://github.com/UCI-CARL/CARLsim4.git

RUN mkdir $HOME/installdir

ENV CARLSIM4_INSTALL_DIR=$HOME/installdir

ENV CUDA_PATH=/usr/local/cuda

RUN cd CARLsim4

RUN make distclean

RUN make

RUN make install