#!/bin/bash

TMPFILE=$(mktemp)
curl --silent https://tools.ietf.org/wg/oauth/ |grep /html/dra | cut -d"'" -f 4 | sed -e 's/.txt//g'| awk '{print "https://datatracker.ietf.org/doc"$1".html"}' > $TMPFILE
curl --silent https://openid.net/developers/specs/ |grep https://openid.net/specs | cut -d '"' -f 2 >> $TMPFILE

echo $TMPFILE
cat $TMPFILE

mkdir -p html
pushd html
wget -i $TMPFILE
popd
find html -size 0 -delete
