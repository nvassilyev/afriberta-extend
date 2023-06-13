#!/bin/bash
set -e

echo "start run_all.sh" >> log.txt
on_exit() {
    echo "run_all failed" >> log.txt
    echo "" >> log.txt
}

trap on_exit EXIT

lang_codes[0]="yor"
lang_codes[1]="ara"
# lang_codes[2]="xho"

num_lang=${#lang_codes[@]}

for i in $(seq 0 $((num_lang-1)))
do
    lang=${lang_codes[$i]}
    bash run_mlm.sh $lang 0 0
    echo "run_mlm.sh $lang 0 0" >> log.txt
    bash run_mlm.sh $lang 0 1
    echo "run_mlm.sh $lang 0 1" >> log.txt
    bash run_mlm.sh $lang 1 0
    echo "run_mlm.sh $lang 1 0" >> log.txt
    bash run_mlm.sh $lang 1 1
    echo "run_mlm.sh $lang 1 1" >> log.txt

    for j in 0 1
    do
        bash run_ner.sh $lang 0 0 $j
        echo "run_ner.sh $lang 0 0 $j" >> log.txt
        bash run_ner.sh $lang 0 1 $j
        echo "run_ner.sh $lang 0 1 $j" >> log.txt
        bash run_ner.sh $lang 1 0 $j
        echo "run_ner.sh $lang 1 0 $j" >> log.txt
        bash run_ner.sh $lang 1 1 $j
        echo "run_ner.sh $lang 1 1 $j" >> log.txt
    done
done
echo "run_all succeeded" >> log.txt
echo "" >> log.txt