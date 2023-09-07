install:
	pip install --upgrade pip
	pip install -r requirements.txt

test:
	python -m pytest --nbval Basics_of_QSP_pennylane.ipynb

format:
	#black *.py
	black *.ipynb


lint:
	pylint --disable=R,C Basics_of_QSP_pennylane.ipynb
	#pylint --disable=R,C test.py


env: requirements.txt
	virtualenv ~/.venv
	~/.venv/bin/pip install -r requirements.txt
	echo "source ~/.venv/bin/activate" >>  ~/.bashrc
	

#run: ~/.venv/bin/activate
#	~/.venv/bin/python3 test.py

#all: install lint test run