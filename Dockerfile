FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu16.04
# https://github.com/rubenrtorrado/GVGAI_GYM.git

RUN apt update \
	&& apt install -y git-core\
	&& apt install -y unzip

#CARLSIM

RUN mkdir $HOME/installdir

ENV CARLSIM4_INSTALL_DIR=$HOME/installdir

ENV CUDA_PATH=/usr/local/cuda

RUN cd $CUDA_PATH \
	&& git clone https://github.com/NVIDIA/cuda-samples \ 
	&& mkdir samples \
	&& cd samples \
	&& mkdir common \
	&& cd common \
	&& mkdir inc \
	&& cd inc \
	&& cp -r $CUDA_PATH/cuda-samples/Common/* . \
	&& echo $PWD \
	&& echo $(ls)

RUN git clone --recursive https://github.com/UCI-CARL/CARLsim4.git \
	&& cd CARLsim4 \
	&& make distclean \
	&& make \
	&& make install

