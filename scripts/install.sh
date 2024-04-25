#!/bin/sh

vm="squeak"
destino_ejecutable="scripts"

repo="Cuis-University/Cuis-University"
asset_name="linux64"
asset_file="$asset_name.tar.gz"

# Obtener última versión
latest_tag=$(curl -s https://api.github.com/repos/$repo/releases/latest | sed -Ene '/^ *"tag_name": *"(v.+)",$/s//\1/p')

# Descargar
wget https://github.com/$repo/releases/download/$latest_tag/$asset_file

# Extraer
tar -xf $asset_file

# Crear carpeta de destino
destino_cuis=$latest_tag
mkdir -p $destino_cuis

# Hacer copia de seguridad de la versión previamente instalada
cp -r $destino_cuis $destino_cuis.old
rm -r $destino_cuis/*

# Mover contenido
mv $asset_name/* $destino_cuis

# Adaptar ejecutable
sed \
	-e "s;[^\\/]*/${vm} ;${vm} ${destino_cuis}\\/;g" \
	"$destino_cuis/run.sh" > "${destino_ejecutable}/run.sh" 
