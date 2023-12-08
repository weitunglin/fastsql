conda create -n resdsql python=3.8.5
conda install pytorch==1.11.0 torchvision==0.12.0 torchaudio==0.11.0 cudatoolkit=11.3 -c pytorch
pip install -r requirements.txt
pip install https://github.com/explosion/spacy-models/releases/download/en_core_web_sm-2.2.0/en_core_web_sm-2.2.0.tar.gz
python nltk_downloader.py
mkdir eval_results
mkdir models
mkdir tensorboard_log
mkdir third_party
mkdir predictions
cd third_party
git clone https://github.com/ElementAI/spider.git
git clone https://github.com/ElementAI/test-suite-sql-eval.git
mv ./test-suite-sql-eval ./test_suite
cd ..
