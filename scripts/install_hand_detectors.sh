#!/bin/bash

# Copyright (c) Facebook, Inc. and its affiliates.

mkdir -p detectors
cd detectors

pip install gdown

# Install 100-DOH hand-object detectors
git clone git@github.com:ddshan/hand_object_detector.git
if [ ! -d hand_object_detector ]; then
    git clone https://github.com/ddshan/hand_object_detector
fi
# compile
cd hand_object_detector/lib
# go to the commit that is compatible with the current version of detectron2
git reset --hard 27d9577c8e60b9cae3b8eefc0d23262af5e39bfd
# python setup.py build develop
cd ../../

# Install 100-DOH hand-only detectors
git clone git@github.com:ddshan/hand_detector.d2.git
if [ ! -d hand_detector.d2 ]; then
    git clone https://github.com/ddshan/hand_detector.d2.git
fi
mv hand_detector.d2 hand_only_detector

# downloading weights
gdown https://drive.google.com/uc?id=1H2tWsZkS7tDF8q1-jdjx6V9XrK25EDbE
gdown https://drive.google.com/uc?id=1OqgexNM52uxsPG3i8GuodDOJAGFsYkPg
mkdir -p ../extra_data/hand_module/hand_detector
mv *pth ../extra_data/hand_module/hand_detector