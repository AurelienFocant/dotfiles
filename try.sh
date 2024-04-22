#########################
# not working at all    #
#########################

dotfiles=$(/bin/ls -a $PWD | grep ^[.][a-z] | grep -v "^.git\$")

for dot in $dotfiles; do
	echo $dot;
done

echo

globbing=($PWD/.[a-z]*)

for file in ${globbing[@]}; do
	echo $file;
done
