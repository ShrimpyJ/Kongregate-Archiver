#!/bin/bash

# For each catalog page, get the url for every game (16 per catalog page)

find urls | xargs -n1 -P32 awk '/href="http[s]?:\/\/www.kongregate.com\/games/ && /">$/ {print $6}' | sed 's/^......//' | sed 's/..$//' > pages.txt
