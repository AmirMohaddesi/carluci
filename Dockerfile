FROM nvidia/cuda:10.1-cudnn7-devel-ubuntu16.04
# https://github.com/rubenrtorrado/GVGAI_GYM.git

#CARLSIM
RUN git clone --recursive https://github.com/UCI-CARL/CARLsim4.git
