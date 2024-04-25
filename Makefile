install:
	sh scripts/install.sh

run:
	sh scripts/run.sh

clone:
	gh repo clone "$(ORG)/$(CUATRI)-$(ejercicio)-$(grupo)"
