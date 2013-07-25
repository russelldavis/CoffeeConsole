#!/bin/sh
set -e
cd $(dirname $0)
app_dir=CoffeeConsole.app
tmp_app_nw_dir=app.nw/
app_nw_dir=$app_dir/Contents/Resources/app.nw/

rm -rf "$tmp_app_nw_dir"
mkdir "$tmp_app_nw_dir"
# Using git ls-tree to exclude the releases directory, and any other junk we don't want
git ls-tree --name-only HEAD | xargs -I {} cp -R {} "$tmp_app_nw_dir"
rm -rf "$app_nw_dir"
mv "$tmp_app_nw_dir" "$app_nw_dir"

cp Info.plist $app_dir/Contents/
