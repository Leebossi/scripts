#!/bin/bash
# This script converts a video file into gif using cloudconvert cli API
# file given as argument
# output is 960p 9:16 24fps

file=$1
homedir=$HOME
outputdir=$homedir/Downloads

# Check if Node is installed
if ![[type node > /dev/null 2>&1 && which node > /dev/null 2>&1]] ;then
  echo "install node"
  # Download and install nvm:
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
  # in lieu of restarting the shell
  \. "$HOME/.nvm/nvm.sh"
  # Download and install Node.js:
  nvm install 24
  # Verify the Node.js version:
  node -v # Should print "v24.12.0".
  # Verify npm version:
  npm -v # Should print "11.6.2".
  # Install cloudconvert CLI
  npm install -g cloudconvert-cli
fi
echo "converting $file"
cloudconvert convert --overwrite --outputdir $outputdir -f gif -p.width=540 -p.heigth=960 -p.fps=24 $file
