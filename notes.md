# quick start scripts

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

# experiment results

## full spider dev result w/ pretrained text2natsql-t5-base

{
    "ckpt": "./models/text2natsql-t5-base/checkpoint-14352",
    "EM": 0.7408123791102514,
    "EXEC": 0.8017408123791102
}

## dog_kennels

### dog_kennels dev result w/ pretrained text2natsql-t5-base

{
    "ckpt": "./models/text2natsql-t5-base/checkpoint-14352",
    "EM": 0.5909090909090909,
    "EXEC": 0.8636363636363636
}

### dog_kennels dev result w/ finetuned lora on text2natsql-t5-base

{
  "lora_ckpt": "./models/text2natsql-t5-base-dog-kennels-lora/checkpoint-651.lora",
  "ckpt": "./models/text2natsql-t5-base/checkpoint-14352",
  "EM": 0.6666666666666666,
  "EXEC": 0.9523809523809523
}

### dog_kennels dev result w/ full finetuned text2natsql-t5-base 

{
  "ckpt": "./models/text2natsql-t5-base-dog-kennels/checkpoint-21",
  "EM": 0.5238095238095238,
  "EXEC": 0.9047619047619048
}

## car

### car dev result w/ pretrained text2natsql-t5-base

{
  "ckpt": "./models/text2natsql-t5-base/checkpoint-14352",
  "EM": 0.4642857142857143,
  "EXEC": 0.6071428571428571
}

### car dev result w/ finetuned lora on text2natsql-t5-base

{
  "lora_ckpt": "./models/text2natsql-t5-base-car-lora/checkpoint-912.lora",
  "ckpt": "./models/text2natsql-t5-base/checkpoint-14352",
  "EM": 0.5,
  "EXEC": 0.7142857142857143
}

## dataset sample / db count

### dev
{'battle_death': 16, 'car_1': 92, 'concert_singer': 45, 'course_teach': 30, 'cre_Doc_Template_Mgt': 84, 'dog_kennels': 82, 'employee_hire_evaluation': 38, 'flight_2': 80, 'museum_visit': 18, 'network_1': 56, 'orchestra': 40, 'pets_1': 42, 'poker_player': 40, 'real_estate_properties': 4, 'singer': 30, 'student_transcripts_tracking': 78, 'tvshow': 62, 'voter_1': 15, 'world_1': 120, 'wta_1': 62}

### train
{'activity_1': 88, 'aircraft': 46, 'allergy_1': 98, 'apartment_rentals': 80, 'architecture': 17, 'assets_maintenance': 31, 'baseball_1': 82, 'behavior_monitoring': 40, 'bike_1': 104, 'body_builder': 24, 'book_2': 21, 'browser_web': 18, 'candidate_poll': 40, 'chinook_1': 84, 'cinema': 30, 'city_record': 40, 'climbing': 40, 'club_1': 70, 'coffee_shop': 18, 'college_1': 164, 'college_2': 170, 'college_3': 74, 'company_1': 7, 'company_employee': 16, 'company_office': 40, 'county_public_safety': 40, 'cre_Doc_Control_Systems': 33, 'cre_Doc_Tracking_DB': 90, 'cre_Docs_and_Epenses': 84, 'cre_Drama_Workshop_Groups': 82, 'cre_Theme_park': 84, 'csu_1': 70, 'culture_company': 38, 'customer_complaints': 46, 'customer_deliveries': 16, 'customers_and_addresses': 88, 'customers_and_invoices': 82, 'customers_and_products_contacts': 15, 'customers_campaigns_ecommerce': 15, 'customers_card_transactions': 80, 'debate': 15, 'decoration_competition': 15, 'department_management': 16, 'department_store': 88, 'device': 40, 'document_management': 44, 'dorm_1': 100, 'driving_school': 93, 'e_government': 40, 'e_learning': 82, 'election': 68, 'election_representative': 20, 'entertainment_awards': 22, 'entrepreneur': 40, 'epinions_1': 30, 'farm': 40, 'film_rank': 48, 'flight_1': 96, 'flight_4': 82, 'flight_company': 19, 'formula_1': 80, 'game_1': 86, 'game_injury': 19, 'gas_company': 46, 'gymnast': 40, 'hospital_1': 100, 'hr_1': 124, 'icfp_1': 66, 'inn_1': 74, 'insurance_and_eClaims': 40, 'insurance_fnol': 42, 'insurance_policies': 48, 'journal_committee': 18, 'loan_1': 80, 'local_govt_and_lot': 17, 'local_govt_in_alabama': 15, 'local_govt_mdm': 14, 'machine_repair': 30, 'manufactory_1': 80, 'manufacturer': 16, 'match_season': 58, 'medicine_enzyme_interaction': 44, 'mountain_photos': 17, 'movie_1': 98, 'music_1': 100, 'music_2': 100, 'music_4': 60, 'musical': 40, 'network_2': 86, 'news_report': 18, 'party_host': 30, 'party_people': 44, 'performance_attendance': 15, 'perpetrator': 21, 'phone_1': 29, 'phone_market': 15, 'pilot_record': 15, 'product_catalog': 42, 'products_for_hire': 18, 'products_gen_characteristics': 86, 'program_share': 40, 'protein_institute': 20, 'race_track': 42, 'railway': 21, 'restaurant_1': 22, 'riding_club': 17, 'roller_coaster': 17, 'sakila_1': 82, 'school_bus': 18, 'school_finance': 26, 'school_player': 40, 'scientist_1': 48, 'ship_1': 48, 'ship_mission': 30, 'shop_membership': 44, 'small_bank_1': 50, 'soccer_1': 14, 'soccer_2': 106, 'solvency_ii': 15, 'sports_competition': 52, 'station_weather': 16, 'store_1': 112, 'store_product': 44, 'storm_record': 44, 'student_1': 68, 'student_assessment': 53, 'swimming': 30, 'theme_gallery': 40, 'tracking_grants_for_research': 78, 'tracking_orders': 60, 'tracking_share_transactions': 41, 'tracking_software_problems': 48, 'train_station': 23, 'twitter_1': 27, 'university_basketball': 46, 'voter_2': 72, 'wedding': 20, 'wine_1': 82, 'workshop_paper': 30, 'wrestler': 40}

