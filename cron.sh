#!/bin/bash
cd $(dirname $0)
fn=$(mktemp)
fn2=$(mktemp)
(while read domain; do 
	echo -e "$domain\t$(./sslinfo.sh $domain)" >> $fn
	echo -e "$domain\t$(./httpcode.sh $domain)" >> $fn2
done) < domains.txt 

mv $fn result.cache
mv $fn2 result-code.cache
