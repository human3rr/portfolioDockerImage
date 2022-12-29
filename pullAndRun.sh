#!/usr/bin/env bash
#Script used inside container to pull from repo's on each container spinup
git pull
git -C portfolio pull
git -C portfolio/motivation-tracker pull
git -C portfolio/memoryGame pull
git -C portfolio/snake pull
node serveFiles.js
