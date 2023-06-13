from datasets import load_dataset
from tokenizers import ByteLevelBPETokenizer
from transformers import AutoModelForMaskedLM
import os

languages = ['yor', 'ara']

for lang in languages:
    file_path = f'../data/mlm/{lang}/train.txt'
    dataset = load_dataset(
                'text',
                data_files=file_path,
                cache_dir='../cache',
                use_auth_token=True,
            )

    tokenizer = ByteLevelBPETokenizer()

    def batch_iterator(batch_size=1000):
        for i in range(0, len(dataset), batch_size):
            yield dataset['train'][i: i + batch_size]["text"]

    # Customized training
    tokenizer.train_from_iterator(batch_iterator(), vocab_size=70006, min_frequency=2, special_tokens=[
        "<s>",
        "<pad>",
        "</s>",
        "<unk>",
        "<mask>",
    ])

    dirs = [f"../models/mlm/{lang}_mlm_vocab", f"../models/mlm/{lang}_mlm_freeze_vocab"]

    for dir in dirs:
        if not os.path.exists(dir):
            os.makedirs(dir)

    tokenizer.save(dirs[0] + "/tokenizer.json")
    tokenizer.save(dirs[1] + "/tokenizer.json")
    model = AutoModelForMaskedLM.from_pretrained("castorini/afriberta_large")
    model.save_pretrained(dirs[0])
    model.save_pretrained(dirs[1])