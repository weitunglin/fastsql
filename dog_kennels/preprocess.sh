set -e

# preprocess train_spider dataset
python preprocessing.py \
    --mode "train" \
    --table_path "./data/spider/tables.json" \
    --input_dataset_path "./dog_kennels/train.json" \
    --natsql_dataset_path "./dog_kennels/train_natsql.json" \
    --output_dataset_path "./dog_kennels/preprocessed_data/preprocessed_train_natsql.json" \
    --db_path "./database" \
    --target_type "natsql"

# preprocess dev dataset
python preprocessing.py \
    --mode "eval" \
    --table_path "./data/spider/tables.json" \
    --input_dataset_path "./dog_kennels/dev.json" \
    --natsql_dataset_path "./dog_kennels/dev_natsql.json" \
    --output_dataset_path "./dog_kennels/preprocessed_data/preprocessed_dev_natsql.json" \
    --db_path "./database" \
    --target_type "natsql"

# preprocess tables.json for natsql
python NatSQL/table_transform.py \
    --in_file "./data/spider/tables.json" \
    --out_file "./dog_kennels/preprocessed_data/tables_for_natsql.json" \
    --correct_col_type \
    --remove_start_table  \
    --analyse_same_column \
    --table_transform \
    --correct_primary_keys \
    --use_extra_col_types
