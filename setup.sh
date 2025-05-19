#!/bin/bash
# Dotfiles Setup Script
# Liam Fruzyna
# 2019-08-10
# Creates links to all files in current directory (recursively) relative to the home directory.

# where to link files to
# (doesn't find files from here)
src=$PWD
# where to create links
dest=~

echo "Linking all files in $src to $dest"

# iterate through all files in working directory and subdirectories
for f in $(find . -type f -not -path "./root/*" -not -path "./.git/*" -not -path "./.mozilla/*" -not -path "./README.md"); do
	# ignore this script
	if [ "$f" != "./setup.sh" ]; then
		echo "---"
		# name of the file (including any directories)
		name=${f:2:${#f}-2}
		# file to link to
		target=$src/$name
		# path of link
		link=$dest/$name
		# parent directory of link
		dir=$(dirname $link)
		# make parent directory if it doesn't exist
		if ! test -d $dir; then
            # remove file if exists in dir
			if test -f $dir; then
				echo "Removing existing file, $dir"
				rm $dir
			elif test -L $dir; then
				echo "Removing existing link, $dir"
				unlink $dir
			fi
			echo "Creating parent directory, $dir"
			mkdir -p $link
		fi
		# remove file if it already exists
		if test -f $link; then
			echo "Removing existing file, $link"
			rm $link
		# remove link if it already exists
		elif test -L $link; then
			echo "Removing existing link, $link"
			unlink $link
		elif test -d $link; then
			echo "Removing existing directory, $link"
			rm -rf $link
		fi
		# create symbolic link
		echo "Linking $link > $target"
		ln -s $target $link
	fi
done

# custom placement for Firefox flatpak
ff_profile=~/.var/app/org.mozilla.firefox/.mozilla/firefox/*.default-release
for prof in $ff_profile; do
    mkdir -p $prof/chrome
    cp .mozilla/firefox/profile/chrome/userChrome.css $prof/chrome
done