# Dotfiles Setup Script
# Liam Fruzyna
# 2019-08-10
# Creates links to all files in current directory (recursively) relative to the home directory.
#!/bin/bash

# where to link files to
# (doesn't find files from here)
src=$PWD
# where to create links
dest=~

echo "Linking all files in $src to $dest"

# iterate through all files in working directory and subdirectories
for f in $(find . -type f -not -path "./root/*"); do
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
			echo "Creating parent directory, $dir"
			mkdir -p $link
		fi
		# remove file if it already exists
		if test -f $link; then
			echo "Removing existing file, $link"
			rm $link
		fi
		# remove link if it already exists
		if test -L $link; then
			echo "Removing existing link, $link"
			unlink $link
		fi
		# create symbolic link
		echo "Linking $link > $target"
		ln -s $target $link
	fi
done
