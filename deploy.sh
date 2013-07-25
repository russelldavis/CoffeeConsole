#!/bin/sh
set -e
outfile=CoffeeConsole.app.zip
rm -f $outfile
zip -r $outfile CoffeeConsole.app

dest=${1:-${COFFEE_CONSOLE_DEPLOY_DIR}}
if [ "$dest" ]; then
	echo moving
	mv $outfile $dest
fi
