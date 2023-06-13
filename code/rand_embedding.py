# Randomizes rows of embedding layer in AfriBERTa

from transformers import AutoTokenizer, AutoModelForMaskedLM
import torch

model = AutoModelForMaskedLM.from_pretrained("../models/afriberta")

embedding = model.base_model.get_input_embeddings()
vocab_size = embedding.weight.shape[0]
permutation = torch.randperm(vocab_size)

embedding.weight.data = embedding.weight.data[permutation, :]
model.base_model.set_input_embeddings(embedding)

model.save_pretrained("../models/afriberta_rand")