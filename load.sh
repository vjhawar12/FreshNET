#!/bin/bash

mv /root/.cache/kagglehub/datasets/swoyam2609/fresh-and-stale-classification/versions/1/dataset/Test /content/dataset/Test
mv /root/.cache/kagglehub/datasets/swoyam2609/fresh-and-stale-classification/versions/1/dataset/Train /content/dataset/Train
mv /content/dataset/Test/fresh* /content/dataset/Test/fresh
mv /content/dataset/Test/rotten* /content/dataset/Test/rotten
mv /content/dataset/Train/fresh* /content/dataset/Train/fresh
mv /content/dataset/Train/rotten* /content/dataset/Train/rotten

mv /content/dataset/Test/fresh/fresh*/* /content/dataset/Test/fresh
mv /content/dataset/Test/rotten/rotten*/* /content/dataset/Test/rotten
mv /content/dataset/Train/fresh/fresh*/* /content/dataset/Train/fresh
mv /content/dataset/Train/rotten/rotten*/* /content/dataset/Train/rotten

rm -r /content/dataset/Train/rotten/rotten*
rm -r /content/dataset/Test/rotten/rotten*
rm -r /content/dataset/Train/fresh/fresh*
rm -r /content/dataset/Test/fresh/fresh*
