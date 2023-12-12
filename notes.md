```
bash install_conda.sh
```

```
bash install_package.sh
```

```
gdown 1UWNj1ZADfKa1G5I4gBYCJeEQO6piMg4G
gdown 1QyfSfHHrxfIM5X9gKUYNr_0ZRVvb1suV
gdown 19tsgBGAxpagULSl9r85IFKIZb4kyBGGu
gdown 1s4ItreFlTa8rUdzwVRmUR2Q9AHnxbNjo

unzip -qq data.zip
unzip -qq database.zip
unzip -qq text2natsql-t5-base.zip
unzip -qq text2natsql_schema_item_classifier.zip

mkdir models/
mv text2natsql_schema_item_classifier/ models/
mv text2natsql-t5-base/ models/


```

```
sh scripts/inference/infer_text2natsql.sh base spider 1

after preprocess:
    /workspace/resdsql/data/preprocessed_data/preprocessed_test_natsql.json
    /workspace/resdsql/data/preprocessed_data/resdsql_test_natsql.json
    /workspace/resdsql/data/preprocessed_data/test_tables_for_natsql.json
    /workspace/resdsql/data/preprocessed_data/test_with_probs_natsql.json
```

```
sh ./scripts/train/text2natsql/preprocess.sh
sh ./scripts/train/text2natsql/generate_text2natsql_dataset.sh
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
