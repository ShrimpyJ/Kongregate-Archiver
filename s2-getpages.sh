#!/bin/bash

# For every individual game page url, get its HTML data and trim to one relevant line to save space 

cd pages;

cat ../pages.txt | xargs -n1 -P32 sh -c 'for arg do name=$(echo $arg | awk '\''BEGIN {FS="/"} {print $6}'\''); wget $arg; sed -i '\''1,278d'\'' $name; sed -i '\''2, $d'\'' $name; done' _
