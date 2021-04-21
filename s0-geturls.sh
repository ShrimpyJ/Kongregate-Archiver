#!/bin/bash

# Generate urls for all catalog pages (16 games/page) oldest to new

make flashgenpages && ./flashgenpages > out.txt && cd urls && cat ../out.txt | xargs -n1 -P32 wget
