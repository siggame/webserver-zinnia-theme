.PHONY: default project clean db

default: bin/buildout
	python bin/buildout

bin/buildout: bootstrap.py
	python bootstrap.py

clean:
	find ./ -name *.pyc -delete

db:
	rm -f demo_zinnia_bootstrap/demo.db
	bin/demo syncdb --noinput
	bin/demo loaddata demo_zinnia_bootstrap/fixtures/initial_data.json
