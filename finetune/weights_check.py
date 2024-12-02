import torch

try:
    weights = torch.load("cogvideox-lora-single-node/checkpoint-2000/pytorch_lora_weights.bin", map_location="cpu")
    print("Weights loaded successfully:", weights.keys())
except Exception as e:
    print("Error loading weights:", e)

