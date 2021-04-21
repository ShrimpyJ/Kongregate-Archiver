#!/bin/bash

# Process each game's HTML file (should only have one line).
# Currently, the algorithm involves looking at the two 4-digit number in the game_icons url
#   For example, /0000/0435/
#   Dividing the second number (0435) by 2 and rounding up should give the number for the game_files url where the .swf is
#   Prepending the chat.kongregate url and appending the game's title and '.swf' should lead to a working link.
#   For example, https://chat.kongregate.com/game_files/0000/0001/crazy-climber.swf is the link to the first game uploaded
# This algorithm only seems to work for the first ~600 games uploaded to the site.
# I've tried brute forcing the numbers on random games but have had no success.

find pages | xargs -n1 -P32 awk '/^    <meta/ && /.kongcdn.com\/game_icons\// {print $3, FILENAME}' | sed 's/^.*\(game_icons\)//' | sed 's/^/https:\/\/chat.kongregate.com\/game_files/' | awk 'BEGIN {FS="/"}; {printf("%s/%s/%s/%s/%s/",$1,$2,$3,$4,$5);} {printf("%04d/", $6 / 2 + 0.5)} {print $8}' | sed 's/.[0-9]$//' | sed 's/$/.swf/' | sort > games.txt
