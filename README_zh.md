# CogVideoX

[Read this in English.](./README_zh)


<div align="center">
<img src=resources/logo.svg width="50%"/>
</div>
<p align="center">
🤗 在 <a href="https://huggingface.co/spaces/THUDM/CogVideoX" target="_blank">CogVideoX Huggingface Space</a> 体验视频生成模型
</p>
<p align="center">
📚 查看 <a href="resources/CogVideoX.pdf" target="_blank">论文</a>
</p>
<p align="center">
    👋 加入我们的 <a href="resources/WECHAT.md" target="_blank">微信</a> 和  <a href="https://discord.gg/Ewaabk6s" target="_blank">Discord</a> 
</p>
<p align="center">
📍 前往<a href="https://chatglm.cn/video"> 清影</a> 和 <a href="https://open.bigmodel.cn/?utm_campaign=open&_channel_track_key=OWTVNma9"> API平台</a> 体验更大规模的商业版视频生成模型。
</p>

## 项目更新

- 🔥 **News**: ``2024/8/6``: 我们开源 **3D Causal VAE**，用于 **CogVideoX-2B**，可以几乎无损地重构视频。
- 🔥 **News**: ``2024/8/6``: 我们开源 CogVideoX 系列视频生成模型的第一个模型, **CogVideoX-2B**。

**性能更强，参数量更大的模型正在到来的路上～，欢迎关注**

## CogVideoX-2B 视频作品

<div align="center">
  <video src="https://github.com/user-attachments/assets/ea3af39a-3160-4999-90ec-2f7863c5b0e9" width="80%" controls autoplay></video>
  <p>A detailed wooden toy ship with intricately carved masts and sails is seen gliding smoothly over a plush, blue carpet that mimics the waves of the sea. The ship's hull is painted a rich brown, with tiny windows. The carpet, soft and textured, provides a perfect backdrop, resembling an oceanic expanse. Surrounding the ship are various other toys and children's items, hinting at a playful environment. The scene captures the innocence and imagination of childhood, with the toy ship's journey symbolizing endless adventures in a whimsical, indoor setting.</p>
</div>

<div align="center">
  <video src="https://github.com/user-attachments/assets/9de41efd-d4d1-4095-aeda-246dd834e91d" width="80%" controls autoplay></video>
  <p>The camera follows behind a white vintage SUV with a black roof rack as it speeds up a steep dirt road surrounded by pine trees on a steep mountain slope, dust kicks up from its tires, the sunlight shines on the SUV as it speeds along the dirt road, casting a warm glow over the scene. The dirt road curves gently into the distance, with no other cars or vehicles in sight. The trees on either side of the road are redwoods, with patches of greenery scattered throughout. The car is seen from the rear following the curve with ease, making it seem as if it is on a rugged drive through the rugged terrain. The dirt road itself is surrounded by steep hills and mountains, with a clear blue sky above with wispy clouds.</p>
</div>

<div align="center">
  <video src="https://github.com/user-attachments/assets/941d6661-6a8d-4a1b-b912-59606f0b2841" width="80%" controls autoplay></video>
  <p>A street artist, clad in a worn-out denim jacket and a colorful bandana, stands before a vast concrete wall in the heart, holding a can of spray paint, spray-painting a colorful bird on a mottled wall.</p>
</div>

<div align="center">
  <video src="https://github.com/user-attachments/assets/938529c4-91ae-4f60-b96b-3c3947fa63cb" width="80%" controls autoplay></video>
  <p>In the haunting backdrop of a war-torn city, where ruins and crumbled walls tell a story of devastation, a poignant close-up frames a young girl. Her face is smudged with ash, a silent testament to the chaos around her. Her eyes glistening with a mix of sorrow and resilience, capturing the raw emotion of a world that has lost its innocence to the ravages of conflict.</p>
</div>

## 模型介绍

CogVideoX是 [清影](https://chatglm.cn/video) 同源的开源版本视频生成模型。

下表战展示目前我们提供的视频生成模型列表，以及相关基础信息:

| 模型名字           | CogVideoX-2B                                                                                                                         | 
|----------------|--------------------------------------------------------------------------------------------------------------------------------------|
| 提示词语言          | English                                                                                                                              | 
| 推理显存消耗 (FP-16) | 36GB using diffusers (will be optimized before the PR is merged) and 18GB using [SAT](https://github.com/THUDM/SwissArmyTransformer) | 
| 微调显存消耗 (bs=1)  | 42GB                                                                                                                                 |
| 提示词长度上限        | 226 Tokens                                                                                                                           |
| 视频长度           | 6 seconds                                                                                                                            | 
| 帧率（每秒）         | 8 frames                                                                                                                             | 
| 视频分辨率          | 720 * 480                                                                                                                            |
| 量化推理           | 不支持                                                                                                                                  |          
| 多卡推理           | 不支持                                                                                                                                  |                             
| 权重地址           | 🤗 [CogVideoX-2B](https://huggingface.co/THUDM/CogVideoX-2B)                                                                         |

## 项目结构

本开源仓库将带领开发者快速上手 **CogVideoX** 开源模型的基础调用方式、微调示例。

### inference

+ [cli_demo](inference/cli_demo.py): 更详细的推理代码讲解，常见参数的意义，在这里都会提及。
+ [cli_vae_demo](inference/cli_vae_demo.py): 单独执行VAE的推理代码，目前需要71GB显存，将来会优化。
+ [convert_demo](inference/converter_demo.py): 如何将用户的输入转换成适合 CogVideoX的长输入。
+ [web_demo](inference/web_demo.py): 一个简单的streamlit网页应用，展示如何使用 CogVideoX-2B 模型生成视频。

<div style="text-align: center;">
    <img src="resources/web_demo.png" style="width: 100%; height: auto;" />
</div>

### sat

+ [sat_demo](sat/README_zh.md): 包含了 SAT 权重的推理代码和微调代码，推荐基于 CogVideoX
  模型结构进行改进，创新的研究者使用改代码以更好的进行快速的堆叠和开发。

### tools

本文件夹包含了一些工具，用于模型的转换 / Caption 等工作。

+ [convert_weight_sat2hf](tools/convert_weight_sat2hf.py): 将 SAT 模型权重转换为 Huggingface 模型权重。
+ [caption_demo](tools/caption_demo.py): Caption 工具，对视频理解并用文字输出的模型。

## 项目规划

- [x] CogVideoX 模型开源
    - [x] CogVideoX 模型推理示例 (CLI / Web Demo)
    - [x] CogVideoX 在线体验示例 (Huggingface Space)
    - [x] CogVideoX 开源模型API接口示例 (Huggingface)
    - [x] CogVideoX 模型微调示例 (SAT)
    - [ ] CogVideoX 模型微调示例 (Huggingface / SAT)
    - [ ] CogVideoX-Pro 开源(适配 CogVideoX-2B 套件)
    - [ ] CogVideoX 技术报告公开

我们欢迎您的贡献，您可以点击[这里](resources/contribute_zh.md)查看更多信息。

## 模型协议

本仓库代码使用 [Apache 2.0 协议](LICENSE) 发布。

本模型权重和模型实现代码根据 [CogVideoX LICENSE](MODEL_LICENSE) 许可证发布。

## 引用

🌟 如果您发现我们的工作有所帮助，欢迎留下宝贵的stars 🌟

论文还在撰写中，即将发布。