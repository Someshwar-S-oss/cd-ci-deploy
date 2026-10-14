
.PHONY: install format train eval all

ifeq ($(OS),Windows_NT)
PYTHON := .venv/Scripts/python.exe
EVAL_CMD = cmd /c type results\metrics.txt
else
PYTHON := python
EVAL_CMD = cat results/metrics.txt
endif

install:
	$(PYTHON) -m pip install -r requirements.txt

format:
	$(PYTHON) -m black --check train.py

train:
	$(PYTHON) train.py

eval:
	$(EVAL_CMD)

all: install format train eval
