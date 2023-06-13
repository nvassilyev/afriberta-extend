#!/bin/bash
set -e

lang=$1
freeze=$2
vocab=$3

if [ "$freeze" -eq 0 ]; then
    file="run_mlm.py"
    output_dir="${lang}_mlm"
else
    file="run_mlm_freeze.py"
    output_dir="${lang}_mlm_freeze"
fi

if [ "$vocab" -eq 0 ]; then
    echo "Training ${output_dir}"
    CUDA_VISIBLE_DEVICES=0,1 python ../code/${file} \
        --model_name_or_path castorini/afriberta_large \
        --train_file ../data/mlm/${lang}/train.txt \
        --validation_file ../data/mlm/${lang}/eval.txt \
        --per_device_train_batch_size 16 \
        --do_train \
        --do_eval \
        --num_train_epochs 3 \
        --save_steps 50000 \
        --max_seq_length 512 \
        --overwrite_output_dir \
        --cache_dir ../cache \
        --output_dir ../models/mlm/${output_dir}
else
    echo "Training ${output_dir}_vocab"
    CUDA_VISIBLE_DEVICES=0,1 python ../code/${file} \
        --model_name_or_path castorini/afriberta_large \
        --train_file ../data/mlm/${lang}/train.txt \
        --validation_file ../data/mlm/${lang}/eval.txt \
        --per_device_train_batch_size 16 \
        --do_train \
        --do_eval \
        --num_train_epochs 3 \
        --save_steps 50000 \
        --max_seq_length 512 \
        --overwrite_output_dir \
        --cache_dir ../cache \
        --output_dir ../models/mlm/${output_dir}_vocab\
        --tokenizer_name ../models/mlm/${output_dir}_vocab 
fi


