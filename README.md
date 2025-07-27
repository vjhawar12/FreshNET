# 🍓 FreshNET: Lightweight CNN for Fruit/Vegetable Freshness Classification

## 🧠 Overview

**FreshNET** is a custom convolutional neural network inspired by the architectural principles of MobileNet, as introduced in the paper _“MobileNets: Efficient Convolutional Neural Networks for Mobile Vision Applications”_ by Howard et al. It uses **Depthwise Separable Convolutions** and **skip connections** to achieve a lightweight yet expressive architecture, tailored for fine-grained classification of fresh vs. rotten fruits and vegetables.

The model was trained on a custom dataset of ~40,000 high-resolution images and is designed to be deployable on **edge devices**.

---

## 🎯 Motivation

This project is part of a broader system called **D.E.L.P.H.I** (see companion repo), an assistive device that employs computer vision (CV) for object detection. One of its features (on the master brach -- not merged with main yet) is freshness detection for fruits and vegetables. I needed a classifier that was:

- 🧠 Compact enough for mobile hardware
- 🎯 Accurate enough to detect subtle signs of spoilage

After exploring standard CNNs, I studied MobileNet and adapted its concepts into **FreshNET**, modifying the architecture to better suit the task of **freshness detection** in fruits and vegetables.

---

## 📊 Current Results & Next Steps


**Accuracy: 96.3 %**

This model has perfomed at 96.3% on validation set, but since this is part of an assistive device with direct consequences on the well-being of the user, I'm aiming for 98% at least. To do so, I'm looking into inreasing data augmentation slightly and tuning the learning rate scheduler a bit more.  


**Expected Model Size after quantization: 2.75 MB**
**Model size (current) without quantization: 11 MB**

At the moment, the model is not yet quantized due to challenges in aligning the correct versions of PyTorch, TorchVision, and ExecuTorch required for Quantization-Aware Training (QAT) in Export Quantization mode.

However, I expect the model to go from 11 MB to 2.75 MB after quantization since models tend to reduce by ~75% in size after quantization. After I'm able to export and deploy the quantized model on the Pi, I'm going to measure latency and deceide if removing some of the latter layers would be beneficial to lean down the model. I might reduce the number of Depthwise Seperable Convolution blocks down from 7 to 5, and update the channel size, expansion factor etc., accordingly in order to prune the model. 

---

## 🧪 Tech Stack

- PyTorch
- Custom MobileNet-style architecture
- Mixed Precision Training (AMP)
- Cosine Annealing LR Scheduler with Linear Warmup
- Torchvision image transforms & dataloaders
- Depthwise Separable Convolutions from scratch

---

## 📁 Related Projects

- 🔗 [D.E.L.P.H.I Project (Companion Repo)](https://github.com/vjhawar12/D.E.L.P.H.I.) – An assistive technology system utilizing CV.

## 🧩 Next Experiments

- Try pretrained MobileNetV2 as a benchmark
- Compare training time and accuracy
- Evaluate inference latency on Raspberry Pi / Jetson Nano

---

> _“This project helped me deeply understand efficient CNN architectures, training stability issues, and the design tradeoffs between model size, accuracy, and optimization. The next phase is about taking this working core and refining it for deployment and robustness.”_

