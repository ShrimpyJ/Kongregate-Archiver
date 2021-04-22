# Kongregate Archiver

Attempts to scrape Kongregate's HTML pages and generate a working link to each game's .swf file located on chat.kongregate.com. Of the >126,000 games hosted, the method used here can successfully obtain 599 flash games. Until an alternative to the current algorithm is found, this is as many as can be retrieved. The games found are located in the games folder, so just grab that if that's what you're here for. To play them, you can still download the Flash debugger player from Adobe officially. Some games still won't run, however.

## Algorithm

[The Archiveteam wiki page for Kongregate](https://wiki.archiveteam.org/index.php/Kongregate) gives a working link to the first game uploaded to the site, Crazy Climber, at <https://chat.kongregate.com/game_files/0000/0001/crazy-climber.swf>. At first glance, it seems that the numbers /0000/0001/ are a game ID numbered in order of upload time. At some point, however, these numbers become misaligned (possibly because of deleted games). Looking through a game's HTML page for a direct link to a working .swf leads nowhere, only to .swf's which rely on Kongregate's API to run. Diving deeper reveals a line referencing a similar ID for the game thumbnail, (game_icons/0000/0001 for Crazy Climber).

The game_files ID and game_icons ID are related, with the game_files ID being half of the game_icons ID rounded up. For example, the 16th game uploaded to the site, Endless Flight 2, has a game_icons ID of /0000/0031/. We can use this to find the game_files ID by simply performing ceil(31 / 2). This gives the game_files ID as /0000/0016/, which is correct. From this, we can easily recreate the full link by prepending the chat.kongregate link and appending the name 'endless-flight2.swf'. The working link is thus <https://chat.kongregate.com/game_files/0000/0016/endless-flight-2.swf>.

This method only seems to work for the first ~600 games before failing entirely. I've tried to brute force the game_files ID by incrementing the /0000/0000/ to /9999/9999/ for different games but have had no success.

## Running the Script

If you want to run the algorithm to find the games yourself (can take a couple of hours), run either the runall.sh or the individual step .sh files (s0 through s4) on a Linux machine. The only programs run are gcc, find, awk, sed, wget, cat, xargs, and sort, so there should be few problems executing. s2 is definitely the longest, as it's responsible for calling wget on all ~126,000 game page urls and stores them in the 'pages' folder. I've cleared the 'pages' folder for this upload to save space, so it needs to be run or s3 and s4 won't work. Once finished, s2 should leave 'pages' around 1GB large, which is markedly improved from the 21GB it needed before I cut each game's HTML page down to only the line with the game_icons ID.

## Trial and Error

This project might be updated in the future, but only if a way to find more games arises. This was also my first time really working closely with awk, xargs, and sed, so there's probably improvement to be made in the scripts on that front as well.
