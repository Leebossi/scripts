#!/bin/bash
# This script converts a video file into gif using cloudconvert cli API
# file given as argument
# output is 960p 9:16 24fps

file=$1
outputdir=$HOME/Downloads

# Check if Node is installed
if ! type node > /dev/null 2>&1 && which node > /dev/null 2>&1
then
  echo "install Node"
  # Download and install nvm:
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
  # in lieu of restarting the shell
  \. "$HOME/.nvm/nvm.sh"
  # Download and install Node.js:
  nvm install 24
fi

# Check if CLoudconvert CLI is installed
if ! command -v cloudconvert > /dev/null 2>&1 ;
then
  echo "install Cloudconvert CLI"
  # Verify the Node.js version:
  node -v
  # Verify npm version:
  npm -v
  # Install cloudconvert CLI
  npm install -g cloudconvert-cli
fi

echo "converting $file"
cloudconvert convert --overwrite --outputdir $outputdir -f gif -p.width=540 -p.heigth=960 -p.fps=24 $file

