#!/bin/sh
( socat tcp-listen:$PORT,reuseaddr,fork tcp:localhost:3129 ) & exec $(which squid) -NYCd 1
