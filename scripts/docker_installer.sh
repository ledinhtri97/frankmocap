#!/bin/bash

cd /workspace/frankmocap

apt-get update

apt-get install -y libglu1-mesa libxi-dev libxmu-dev libglu1-mesa-dev freeglut3-dev libosmesa6-dev wget git

apt-get install -y ffmpeg 

python -m pip install --upgrade pip

pip install -r docs/requirements.txt

python -m pip install detectron2==0.4 -f \
    https://dl.fbaipublicfiles.com/detectron2/wheels/cu111/torch1.8/index.html

cd /workspace/frankmocap/detectors/pytorch3d

pip install -e .

cd /workspace/frankmocap/detectors/hand_object_detector/lib

python setup.py build develop
