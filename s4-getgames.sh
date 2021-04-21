#!/bin/bash

# Call wget on the games.txt file from last step to get any .swf files that work

cd games && cat ../games.txt | xargs -n1 -P32 wget
