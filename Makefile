install:
	# Install dependencies
	pip install --upgrade pip &&\
		pip install -r requirements.txt

format:
	black *.py

test:
	# Run tests
	# nbval: run each cell of my notebook
	#python -m pytest -nbval ONET_Pred.ipynb

lint:
	# Run code linters
	pylint --disable=R,C

all: install lint test	

clean:
	# Clean up temporary files or build artifacts
	rm -rf build

