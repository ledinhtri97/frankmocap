#!/bin/bash

echo ""
echo ">>  Installing a third-party 2D keypoint detector"
sh scripts/install_pose2d.sh

echo ""
echo ">>  Download extra data for body module"
sh scripts/download_data_body_module.sh


echo ""
echo ">>  Installing a third-party hand detector"
sh scripts/install_hand_detectors.sh


echo ""
echo ">>  Download extra data for hand module"
sh scripts/download_data_hand_module.sh

echo ""
echo ">>  Download extra pytorch3d module"
cd detectors/
git clone https://github.com/facebookresearch/pytorch3d.git
cd pytorch3d
git checkout v0.4.0
cd ../..

echo ""
echo ">>  Download SMPL/SMPL-X Models"
mkdir -p extra_data/smpl
cd extra_data/smpl
wget https://github.com/githubcrj/simplify/raw/refs/heads/master/code/models/basicModel_neutral_lbs_10_207_0_v1.0.0.pkl -O basicModel_neutral_lbs_10_207_0_v1.0.0.pkl
wget https://huggingface.co/camenduru/SMPLer-X/resolve/main/SMPLX_NEUTRAL.pkl -O SMPLX_NEUTRAL.pkl