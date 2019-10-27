#create virtual environment, upgrade before last version pip
ve:
	python -m venv ve
	. ve/bin/activate && exec python -m pip install --upgrade pip

#install requirements for virtual environment, create empty database and migrate
setup: ve
	. ve/bin/activate && exec python -m pip install -r resources/requirements.txt
	resources/./db.sh create
	. ve/bin/activate && exec python manage.py migrate

#run localhost server
run:
	. ve/bin/activate && exec python manage.py runserver

#destroy virtual environment and destroy database
destroy: destroy_ve destroy_db

#destroy database
destroy_db:
	resources/./db.sh destroy

#destroy virtual environment
destroy_ve:
	rm -r ve
