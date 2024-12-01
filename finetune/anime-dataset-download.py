from datasets import load_dataset

dataset = load_dataset("ArtAnime/scene-dataset", split="train")
dataset.save_to_disk("anime_scene_dataset")

print("Anime scene dataset downloaded and saved locally.")

