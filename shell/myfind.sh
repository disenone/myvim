#!/bin/sh
grep -n -r $* --exclude-dir=.svn* --exclude=*.pyc --exclude=*.swp --exclude=*.taghl --exclude=tags
