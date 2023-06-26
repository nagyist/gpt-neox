#!/bin/bash
#SBATCH --job-name="llmath"
# #SBATCH --account=dw87
#SBATCH --comment="eleutherai"
#SBATCH --qos=dw87
#SBATCH --partition=dw
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=8
#SBATCH --cpus-per-task=16
#SBATCH --mem-per-cpu=8GB
#SBATCH --gres=gpu:8
#SBATCH --exclusive
#SBATCH --open-mode=append
#SBATCH --output=410m_flash_%x_%j.out
#SBATCH --error=410m_flash_%x_%j.out
#SBATCH --time=2-00:00:00

# BYU cluster

source /home/hailey81/miniconda3/bin/activate llmath

which python

export LD_LIBRARY_PATH=/home/hailey81/miniconda3/envs/llmath/lib/
export PATH=/home/hailey81/cuda_install/bin:$PATH

ln -s /home/hailey81/miniconda3/envs/llmath/bin/gcc/ ~/.local/bin/gcc
export PATH=$HOME/.local/bin:$PATH

# export WANDB_API_KEY=07cebf97416da7fa921b74774ef771f52d4e49e9
# wandb login
export WANDB_MODE=offline
 
export TRAIN_DIR=/home/za2514/math-lm/gpt-neox/

cd $TRAIN_DIR
pwd

python ./deepy.py train.py --conf_dir /home/za2514/math-lm/gpt-neox/configs/v0.5/ 410M_flash.yml