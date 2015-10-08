#!/usr/bin/env sh
echo "woohoo! we are deploying LanguageCheck!!!"
rsync -av --exclude=.git /Users/LOGIN/code/languagecheck/* leia:/home/valerie/prj/languagecheck
echo ""
