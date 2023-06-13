# General version of run_mlm.sh

file="run_mlm.py"
output_dir="ara_mlm_xlmr"
lang="ara"
model="../models/afriberta_xlmr"
tokenizer="xlm-roberta-base"

CUDA_VISIBLE_DEVICES=0,1 python ../code/${file} \
    --model_name_or_path $model \
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
    --output_dir ../models/mlm/${output_dir} \
    --tokenizer_name $tokenizer
    # --tokenizer_name ../models/mlm/${output_dir}_vocab \
    # per_device_train_batch_size = 16 originally