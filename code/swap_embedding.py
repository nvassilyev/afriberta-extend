# AfriBERTa with XLM-R embedding
# Tokenizer: "xlm-roberta-base"

from transformers import AutoTokenizer, AutoModelForMaskedLM
import torch

# xlmr_tokenizer = AutoTokenizer.from_pretrained("xlm-roberta-base")
xlmr = AutoModelForMaskedLM.from_pretrained("xlm-roberta-base")

afriberta = AutoModelForMaskedLM.from_pretrained("../models/afriberta")

xlmr_embedding = xlmr.base_model.get_input_embeddings()
afriberta.set_input_embeddings(xlmr_embedding)

afriberta.save_pretrained("../models/afriberta_xlmr")