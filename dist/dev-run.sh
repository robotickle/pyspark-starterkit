#!/usr/bin/env bash
spark-submit --master yarn \
--deploy-mode cluster \
--num-executors 30 --executor-memory 32G \
--driver-cores 12 --driver-memory 16G \
--py-files jobs.zip \
main.py \
--job wordcount
