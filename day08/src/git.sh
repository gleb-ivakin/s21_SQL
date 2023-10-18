#!/bin/sh

git add e*/*
git commit -m"$1"
git push origin develop