export PYTHONPATH="${PYTHONPATH}:/workspace/code"
export GPU_ID=0,1


export GLUE_DIR=/workspace/data/datasets/glue_data/glue_data
export TASK_NAME=QNLI # SST-2 # CoLA  # SST-2 # MRPC

python ./examples/run_glue.py \
    --model_type bert \
    --model_name_or_path bert-base-cased \
    --task_name $TASK_NAME \
    --do_train \
    --do_eval \
    --save_steps 200 \
    --data_dir $GLUE_DIR/$TASK_NAME \
    --max_seq_length 128 \
    --per_gpu_eval_batch_size=32   \
    --per_gpu_train_batch_size=32   \
    --learning_rate 2e-5 \
    --num_train_epochs 3.0 \
    --percentage_per_label 1.0 \
    --sample_per_label -1 \
    --output_dir ../output/bert_$TASK_NAME/ \
    --use_freeze \
    --overwrite_output_dir
    
    
