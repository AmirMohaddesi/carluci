FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu16.04
# https://github.com/rubenrtorrado/GVGAI_GYM.git

RUN apt update \
	&& apt install -y git-core\
	&& apt install -y unzip

#CARLSIM
RUN git clone --recursive https://github.com/UCI-CARL/CARLsim4.git


RUN cd CARLsim4

RUN export CARLSIM4_INSTALL_DIR=/CARLSIM4

RUN make nocuda -j4 