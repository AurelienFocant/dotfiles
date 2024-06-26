#! /bin/bash


#-----------------
# Check if cask is installed through homebrew already
# If not, tries to install it
#-----------------

casks="$PWD/casks_homebrew"
sort $casks -o $casks

while read cask; do
	if brew list --cask | grep -q "^$cask\$"; then
		echo $cask is already installed;
	else
		brew install --cask $cask;
	fi
done < $casks


#-----------------
# Does the same for formulae
#-----------------

formulae="./formulae_homebrew"
cat $formulae | xargs brew install --formula

#-----------------
# Could be checking if the soft is already installed with
#
# brew info name-of-software
# need to grep it or something
#-----------------
