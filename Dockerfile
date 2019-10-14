FROM "cwaffles/openpose"

# VOLUME /home/shaun/Programs:/Programs
# WORKDIR /Programs

WORKDIR /openpose/build/examples/tutorial_api_python/

ENV NVIDIA_VISIBLE_DEVICES=0
ENV QT_X11_NO_MITSHM=1

#RUN apt-get update
#RUN apt-get install -y vim git

# Required for opencv

RUN echo 'eval "$(dircolors -p | sed "s/ 4[0-9];/ 01;/; s/;4[0-9];/;01;/g; s/;4[0-9] /;01 /" | dircolors --sh /dev/stdin)"' >> /root/.bashrc
#RUN echo 'export QT_X11_NO_MITSHM=1' >> /root/.bashrc
#RUN echo 'export NVIDIA_VISIBLE_DEVICES=0' >> /root/.bashrc

