#!/bin/bash

NEW_DIR=platzi

if [ ! -d "./$NEW_DIR" ]; then
	mkdir ./$NEW_DIR
fi

cp README.md ./$NEW_DIR/

echo "`date`: Todo listo jefe!"
