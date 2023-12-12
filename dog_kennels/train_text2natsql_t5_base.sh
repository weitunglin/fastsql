set -e

# train text2natsql-t5-base model
python -u text2sql.py \
    --batch_size 4 \
    --gradient_descent_step 1 \
    --device "0,1,2,3" \
    --learning_rate 1e-4 \
    --epochs 5 \
    --seed 42 \
    --save_path "./models/text2natsql-t5-base-dog-kennels" \
    --tensorboard_save_path "./tensorboard_log/text2natsql-t5-base-dog-kennels" \
    --model_name_or_path "./models/text2natsql-t5-base/checkpoint-14352" \
    --use_adafactor \
    --mode train \
    --train_filepath "./dog_kennels/preprocessed_data/resdsql_train_natsql.json"
    
# select the best text2natsql-t5-base ckpt
python -u evaluate_text2sql_ckpts.py \
    --batch_size 4 \
    --device "0,1,2,3" \
    --seed 42 \
    --save_path "./models/text2natsql-t5-base-dog-kennels" \
    --eval_results_path "./eval_results/dog-kennels-text2natsql-t5-base" \
    --mode eval \
    --dev_filepath "./dog_kennels/preprocessed_data/resdsql_dev_natsql.json" \
    --original_dev_filepath "./dog_kennels/dev.json" \
    --db_path "./database" \
    --tables_for_natsql "./dog_kennels/preprocessed_data/tables_for_natsql.json" \
    --num_beams 8 \
    --num_return_sequences 8 \
    --target_type "natsql"
