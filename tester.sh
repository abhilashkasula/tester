#!/bin/bash

declare user='step-batch-7'
# declare repo='geometry-'${1}
# echo "UserName:"
# read user
# echo 'repository'
# read repo

declare src='geometry-'${1}
declare tests='geometry-'${2}
declare File='./src'
echo 'connecting...'
mkdir -p ~/wasteForTester/
cd ~/wasteForTester/
svn export http://github.com/${user}/${src}/trunk/src src > /dev/null
svn export http://github.com/${user}/${tests}/trunk/package.json package.json  1>/dev/null 2>/dev/null
echo 'installing dependencies...'
npm install 1> /dev/null 2> /dev/null
svn export http://github.com/${user}/${tests}/trunk/test otherTests >/dev/null
mocha otherTests
rm -rd * > /dev/null
rm -rd ~/wasteForTester >/dev/null