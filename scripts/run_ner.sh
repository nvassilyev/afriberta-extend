#!/bin/bash
set -e

lang=$1
freeze=$2
vocab=$3
train_500=$4
train_dir="../data/ner"

if [ "$freeze" -eq 0 ]; then
    model="${lang}_mlm"
    output_dir="${lang}_ner"
else
    model="${lang}_mlm_freeze"
    output_dir="${lang}_ner_freeze"
fi

if [ "$vocab" -eq 1 ]; then
    model="${model}_vocab"
    output_dir="${output_dir}_vocab"
fi

if [ "$train_500" -eq 1 ]; then
    train_dir="${train_dir}_500"
    output_dir="${output_dir}_small"
fi

for j in 1 2 3 4 5
do  
    echo "Training ${output_dir} with seed $j"
	export MAX_LENGTH=164
	export BERT_MODEL=$model
	export OUTPUT_DIR=$output_dir
	export TEXT_RESULT=test_result$j.txt
	export TEXT_PREDICTION=test_predictions$j.txt
	export BATCH_SIZE=32
	export NUM_EPOCHS=20
	export SAVE_STEPS=10000
	export SEED=$j
	CUDA_VISIBLE_DEVICES=0,1 python3 ../code/train_ner.py --data_dir ${train_dir}/${lang} \
	--model_type xlmroberta \
	--model_name_or_path ../models/mlm/${BERT_MODEL} \
	--output_dir ../models/ner/${OUTPUT_DIR} \
	--test_result_file $TEXT_RESULT \
	--test_prediction_file $TEXT_PREDICTION \
	--max_seq_length  $MAX_LENGTH \
	--num_train_epochs $NUM_EPOCHS \
	--per_gpu_train_batch_size $BATCH_SIZE \
	--save_steps $SAVE_STEPS \
	--seed $SEED \
	--do_train \
	--do_eval \
	--do_predict \
	--cache_dir ../cache \
	--overwrite_output_dir
done