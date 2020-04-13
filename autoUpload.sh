#!/bin/bash
time=$(date "+%Y-%m-%d %H:%M:%S")
echo "${time}"
echo "-----------------------------------"
git add .
git commit -m "add"
git pull origin master
git push origin master
