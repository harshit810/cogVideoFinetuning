#!/bin/bash

export MODEL_PATH="THUDM/CogVideoX-2b"
export CACHE_PATH="~/.cache"
export DATASET_PATH="Disney-VideoGeneration-Dataset"
export OUTPUT_PATH="cogvideox-lora-multi-gpu"
export PYTORCH_CUDA_ALLOC_CONF=expandable_segments:True
export CUDA_VISIBLE_DEVICES=$CUDA_VISIBLE_DEVICES


#  --use_8bit_adam is necessary for CogVideoX-5B-I2V
# if you are not using wth 8 gus, change `accelerate_config_machine_single.yaml` num_processes as your gpu number
accelerate launch --config_file accelerate_config_machine_single.yaml --multi_gpu \
  train_cogvideox_lora.py \
  --gradient_checkpointing \
  --use_8bit_adam  \
  --pretrained_model_name_or_path $MODEL_PATH \
  --cache_dir $CACHE_PATH \
  --enable_tiling \
  --enable_slicing \
  --instance_data_root $DATASET_PATH \
  --caption_column prompts.txt \
  --video_column videos.txt \
  --validation_prompt "Mickey with the captain and friends:::Mickey and the bear" \
  --validation_prompt_separator ::: \
  --num_validation_videos 1 \
  --validation_epochs 2 \
  --seed 3407 \
  --rank 128 \
  --mixed_precision bf16 \
  --output_dir $OUTPUT_PATH \
  --height 480 \
  --width 720 \
  --fps 8 \
  --max_num_frames 49 \
  --skip_frames_start 0 \
  --skip_frames_end 0 \
  --train_batch_size 1 \
  --num_train_epochs 10 \
  --checkpointing_steps 500 \
  --gradient_accumulation_steps 1 \
  --learning_rate 1e-4 \
  --optimizer AdamW \
  --adam_beta1 0.9 \
  --adam_beta2 0.95