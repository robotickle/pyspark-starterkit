
help:
	@echo "clean - remove all build, test, coverage and Python artifacts"
	@echo "clean-pyc - remove Python file artifacts"
	@echo "clean-test - remove test and coverage artifacts"
	@echo "build - package"
	@echo "push - build and push to Edge01 node under specified directory"

all: default

default: clean lint build

clean: clean-build clean-pyc clean-test

clean-build:
	rm -fr dist/

clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +

clean-test:
	rm -fr .tox/
	rm -f .coverage
	rm -fr htmlcov/

build: clean
	mkdir ./dist
	cp ./src/main.py ./dist
	cp ./dev-run.sh ./dist
	cd ./src && zip -x main.py -x \*libs\* -r ../dist/jobs.zip .

scp:
	scp ./dist/jobs.zip ./dist/main.py ./dist/dev-run.sh skandeka@cj4hdl001.cars.com:/home/skandeka/forDevDeployment/otbModular/

push: build scp
