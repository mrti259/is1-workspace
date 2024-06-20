install:
	sh scripts/install.sh

run:
	sh scripts/run.sh

clone: files
	cd files && gh repo clone "$(ORG)/$(CUATRI)-$(ejercicio)-$(grupo)" 

files:
	mkdir files