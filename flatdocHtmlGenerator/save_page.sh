#!/bin/bash

# Esta funcion recupera el fichero descargado extrae la parte del menu y del contenido
# la mete en el fichero de la plantilla generando finalmente un fichero html estatico
transform() {
	FILENAME=$1
	#Extraigo el contenido
	sed -n "/<!--START-FLATDOC-CONTENT-->/,/<!--END-FLATDOC-CONTENT-->/p" $FILENAME > content.tmp

	#Extraigo el menu
	#sed -n "/<!--START-FLATDOC-MENU-->/,/<!--END-FLATDOC-MENU-->/p" index.html > menu.tmp
	grep '<!--START-FLATDOC-MENU-->' $FILENAME > menu.tmp

	#Creo el index.html
	cp template.html_ $FILENAME.tmp

	#Meto el contenido
	sed -e '/@FLATDOC-CONTENT/ {' -e 'r content.tmp' -e 'd' -e '}' -i $FILENAME.tmp
	rm -f content.tmp

	#Meto el menu
	sed -e '/@FLATDOC-MENU/ {' -e 'r menu.tmp' -e 'd' -e '}' -i $FILENAME.tmp
	rm -f menu.tmp

	#Renombro el fichero
	mv $FILENAME.tmp dist/$FILENAME

	#Borro el fichero
	rm -f $FILENAME

}


#La lista de enlaces de la documentacion, son los "?file=*.md"
LINK_LIST=`wget -q https://osalvador.github.io/dbax-lite/ -O - | tr "\t\r\n'" '   "' |  grep -i -o '<a[^>]\+href[ ]*=[ \t]*"\??[^"]\+"' |  sed -e 's/^.*"\([^"]\+\)".*$/\1/g'`

#Me recorro los enlaces y los descargo en html 
for link in $LINK_LIST
do
	./phantomjs-2.1.1/bin/phantomjs  save_page.js  https://osalvador.github.io/dbax-lite/$link > $(basename $link .md).html
	transform $(basename $link .md).html
done

#descargar tambien el "home"
./phantomjs-2.1.1/bin/phantomjs  save_page.js  https://osalvador.github.io/dbax-lite/ > index.html
transform index.html


# Moverlos todos
mv dist/*.html /var/www/html/documentation/en
