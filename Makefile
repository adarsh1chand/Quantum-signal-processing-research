# Installing dependencies
install:
	pip install --upgrade pip
	pip install -r requirements.txt

# Running tests
test:
	python -m pytest --nbval -vv Basics_of_QSP_pennylane.ipynb

# Running formatting tool
format:
	#black *.py
	black *.ipynb

# Running lint tool
lint:
	nbqa pylint --disable=R,C Basics_of_QSP_pennylane.ipynb
	#pylint --disable=R,C test.py

# Setting up virtual environment and installing all the dependencies
env: requirements.txt
	virtualenv ~/.venv
	~/.venv/bin/pip install --upgrade pip
	~/.venv/bin/pip install -r requirements.txt
	echo "source ~/.venv/bin/activate" >>  ~/.bashrc
	
# Running core setup files in the library/repository
#run: ~/.venv/bin/activate
#	~/.venv/bin/python3 test.py

# Building the entire library, running the core setup files and testing the modules and formatting
#build: env run test lint format