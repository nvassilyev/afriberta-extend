We fine-tune the AfriBERTa model on three African languages: Xhosa, Arabic, and Yoruba. We perform fine-tuning via Masked Language Modeling (MLM) followed by Named Entity Recognition (NER) tasks. Different embedding and tokenizer configurations are explored to evaluate their impact on the performance of the models. Data and models not uploaded due to space constraints.

## Results

The following table presents the results obtained for NER and MLM tasks with different model configurations:

### NER: evaluation F1 scores

| Model                    | F1 Score |
|--------------------------|----------|
| ara_mlm                  | 0.0792   |
| ara_ner                  | 0.081    |
| ara_ner_freeze           | 0.0731   |
| ara_ner_freeze_small     | 0.0271   |
| ara_ner_freeze_vocab     | 0.5211   |
| ara_ner_freeze_vocab_small | 0.2755 |
| ara_ner_small            | 0.0433   |
| ara_ner_vocab            | 0.5434   |
| ara_ner_vocab_small      | 0.3046   |
| ara_ner_xlmr             | 0.3272   |
| xho_ner                  | 0.8669   |
| xho_ner_freeze           | 0.8567   |
| xho_ner_freeze_small     | 0.6553   |
| xho_ner_freeze_vocab_small | 0.521  |
| xho_ner_rand_vocab       | 0.8357   |
| xho_ner_rand_vocab_no_mlm | 0.7351   |
| xho_ner_small            | 0.706    |
| xho_ner_vocab            | 0.8057   |
| xho_ner_vocab_freeze     | 0.7958   |
| xho_ner_vocab_small      | 0.5437   |
| yor_ner                  | 0.8769   |
| yor_ner_freeze           | 0.8791   |
| yor_ner_freeze_small     | 0.7401   |
| yor_ner_freeze_vocab     | 0.7886   |
| yor_ner_freeze_vocab_small | 0.4844 |
| yor_ner_small            | 0.7347   |
| yor_ner_vocab            | 0.7939   |
| yor_ner_vocab_small      | 0.4831   |

### MLM: evaluation accuracy

| Model                    | Evaluation Accuracy |
|--------------------------|---------------------|
| ara_mlm                  | 0.8449              |
| ara_mlm_freeze           | 0.8263              |
| ara_mlm_freeze_vocab     | 0.2527              |
| ara_mlm_vocab            | 0.3694              |
| ara_mlm_xlmr             | 0.1528              |
| xho_mlm                  | 0.6683              |
| xho_mlm_freeze           | 0.5013              |
| xho_mlm_freeze_vocab     | 0.4126              |
| xho_mlm_rand_vocab       | 0.609               |
| xho_mlm_vocab            | 0.6268              |
| yor_mlm                  | 0.5498              |
| yor_mlm_freeze           | 0.5154              |
| yor_mlm_freeze_vocab     | 0.3594              |
| yor_mlm_vocab            | 0.5121              |