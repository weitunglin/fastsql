```
bash install_conda.sh
```

```
bash install_package.sh
```

```
sh scripts/inference/infer_text2natsql.sh base spider
```

```
python -u evaluate_text2sql_ckpts.py \
    --batch_size 8 \
    --device "1" \
    --seed 42 \
    --save_path "./models/text2natsql-t5-base" \
    --eval_results_path "./eval_results/text2natsql-t5-base" \
    --mode eval \
    --dev_filepath "./data/preprocessed_data/resdsql_dev_natsql.json" \
    --original_dev_filepath "./data/spider/dev.json" \
    --db_path "./database" \
    --tables_for_natsql "./data/preprocessed_data/tables_for_natsql.json" \
    --num_beams 8 \
    --num_return_sequences 8 \
    --target_type "natsql"
```

```
sh scripts/train/text2natsql/train_text2natsql_t5_base.sh
```

```
sh scripts/inference/infer_text2natsql.sh base-custom spider
```
