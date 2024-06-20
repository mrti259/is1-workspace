#!/bin/sh

vm="squeak"
dir_vm="vm"
dir_scripts="scripts"

repo="Cuis-University/Cuis-University"
asset_name="linux64"
asset_file="$asset_name.tar.gz"

# Obtener última versión
latest_tag=$(curl -s https://api.github.com/repos/$repo/releases/latest | sed -Ene '/^ *"tag_name": *"(v.+)",$/s//\1/p')

# Definir carpeta de destino
dir_latest_vm=$dir_vm/$latest_tag

# Crear carpeta para vms
if [ ! -d "$dir_vm" ]; then
	mkdir -p $dir_vm
fi

# Hacer copia de seguridad
if [ -d "$dir_latest_vm" ]; then
	mv $dir_latest_vm $dir_latest_vm.old
fi

# Descargar última versio
if [ ! -d "$asset_file" ]; then
	wget https://github.com/$repo/releases/download/$latest_tag/$asset_file
fi

# Extraer archivos
tar -xf $asset_file

# Mover a carpeta de vms
mv $asset_name $dir_latest_vm

# Adaptar ejecutable
sed \
	-e "s;[^\\/]*/${vm} ;${vm} ${dir_latest_vm}\\/;g" \
	"$dir_latest_vm/run.sh" > "${dir_scripts}/run.sh" 

# Limpiar
rm $asset_file ._$asset_name
