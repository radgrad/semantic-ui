#!/bin/bash

set -x # echo on

gulp build

rm -rf ../../radgrad/app/client/lib/semantic-ui
rm -rf ../../radgrad/app/public/themes
mkdir ../../radgrad/app/client/lib/semantic-ui/
cp -r dist/semantic.min.css ../../radgrad/app/public
cp -r dist/semantic.min.js ../../radgrad/app/client/lib/semantic-ui/
cp -r dist/themes ../../radgrad/app/public
