#!/bin/sh
set -e
cd $(dirname $0)
tmp_app_dir=releases/app.nw/
app_dir=releases/CoffeeConsole.app/Contents/Resources/app.nw/

rm -rf "$tmp_app_dir"
mkdir "$tmp_app_dir"
# Using git ls-tree to exclude the releases directory, and any other junk we don't want
git ls-tree --name-only HEAD | xargs -I {} cp -R {} "$tmp_app_dir"
rm -rf "$app_dir"
mv "$tmp_app_dir" "$app_dir"
