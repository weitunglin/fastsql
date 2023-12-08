set -e

# train text2natsql-t5-base model
python -u text2sql.py \
    --batch_size 4 \
    --gradient_descent_step 1 \
    --device "0,1,2,3" \
    --learning_rate 5e-5 \
    --epochs 50 \
    --seed 42 \
    --save_path "./models/text2natsql-t5-base-baseball" \
    --tensorboard_save_path "./tensorboard_log/text2natsql-t5-base-baseball" \
    --model_name_or_path "t5-base" \
    --use_adafactor \
    --mode train \
    --train_filepath "./data/preprocessed_data/resdsql_train_spider_natsql_custom.json"
    
# select the best text2natsql-t5-base ckpt
python -u evaluate_text2sql_ckpts.py \
    --batch_size 4 \
    --device "0,1,2,3" \
    --seed 42 \
    --save_path "./models/text2natsql-t5-base-baseball" \
    --eval_results_path "./eval_results/text2natsql-t5-base-baseball" \
    --mode eval \
    --dev_filepath "./data/preprocessed_data/resdsql_dev_natsql_custom.json" \
    --original_dev_filepath "./data/spider/dev_custom.json" \
    --db_path "./database" \
    --tables_for_natsql "./data/preprocessed_data/tables_for_natsql_custom.json" \
    --num_beams 8 \
    --num_return_sequences 8 \
    --target_type "natsql"
