#!/usr/bin/env bash
python3 -m pip install -r artigo2_requirements.txt
python3 -m ipykernel install --user --name=artigo2-venv
cd ./seminario1/
git clone git@github.com:zedshape/zgrouping.git
