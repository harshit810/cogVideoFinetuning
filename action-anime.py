from datasets import load_dataset

dataset = load_dataset("animeaction", split="train")
dataset.save_to_disk("animeaction_dataset")

print("AnimeAction dataset downloaded and saved locally.")
