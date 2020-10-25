# AI-Gym-Trainer
An application that uses [OpenPose](https://github.com/CMU-Perceptual-Computing-Lab/openpose) to assist with Gym Exercises 

## Motivation

Many people who being exercising lack professional guidance. They tend to miss out on a lot of potential gains 
either by performing the exercise incorrectly or by having poor posture while doing it. In some cases they
may even end up doing more harm than good. 

This application aims to help in that regard by helping and guiding
when performing a variety of exercises.

## Results

<!--Insert gif here: Performing Bicep curls-->
* Currently the program only works on bicep curls, but more exercises will be added in the future
<p align="center">
    <img src="media/Bicep_Curls.gif">
    <br>
    <sup>Program runnning on Bicep Curls.</sup>
    <br>
    <sup>It gives instructions and also points out poor posture.</sup>
</p>

# Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.
## Clone the Repo
```
git clone https://github.com/shaunferns26/AI-Gym-Trainer.git
```

## Installing OpenPose

### Build From Source
To install openpose, you can follow any of the install instructions on their 
[github repo](https://github.com/CMU-Perceptual-Computing-Lab/openpose/blob/master/doc/installation.md), 
But ensure that the version you compile has Python API support.

Also bear in mind that OpenPose has a **lot** of dependencies, so running a premade Docker container will definately
save you a lot of trouble.

### OpenPose Docker Image
An easier way to get OpenPose running is to simply build an [openpose docker image](https://github.com/esemeniuc/openpose-docker) 
from the Dockerfile provided in this repo and run the python program in the docker container. 

#### Prerequisites
* Docker
  * [Windows](https://docs.docker.com/v17.12/docker-for-windows/install/)
  * [Mac](https://docs.docker.com/v17.12/docker-for-mac/install/)
  * [Ubunutu](https://docs.docker.com/v17.12/install/linux/docker-ce/ubuntu/)
  * [Arch Linux](https://wiki.archlinux.org/index.php/Docker)
* nvidia-container-toolkit (Recommended)
  * Openpose is a very heavy application and it needs GPU acceleration to process a video fast. 
  * If you have an Nvidia GPU ensure that you have 
  [nvidia drivers](https://github.com/NVIDIA/nvidia-docker/wiki/Frequently-Asked-Questions#how-do-i-install-the-nvidia-driver) installed
  * Then install the [nvidia-container-toolkit](https://github.com/NVIDIA/nvidia-docker) for docker.
  * If you do not have a GPU then edit the Program file to use the COCO or MPI model instead of the BODY_25 model. 
  These perform better on a CPU.
    
#### Building the Dockerfile into a Docker Image
``` bash
cd AI-Gym-Trainer
docker build -t openpose_python .   
# Or give the docker image any name you want
```

#### Create a docker container from this image
Most of these options are for sharing the PC's webcam with the Docker container, and to display a window 
from a program running in the container on your desktop.
You may need to adjust these to match your settings.

You may also want to [mount](https://docs.docker.com/storage/volumes/) this project's directory or any other 
local directory into the Docker container, for your convenience.

``` bash
docker run --gpus all -it --name openpose_python -e NVIDIA_VISIBLE_DEVICES=0 \
--device=/dev/video0:/dev/video0 --net=host --env="DISPLAY" \
--volume="$HOME/.Xauthority:/root/.Xauthority:rw" \
openpose_python
```

#### Reopening the container later
``` bash
docker start -i openpose_python
```

## Running the Script
Once you have open pose installed, running the script is simple. 
Just copy the file `GymTrainer.py` to the folder:
```
openpose/build/examples/tutorial_api_python/
```
And run it: 
```
python3 GymTrainer.py
```

