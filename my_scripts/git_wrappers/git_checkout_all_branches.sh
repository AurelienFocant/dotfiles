#! /bin/bash

source git_wrappers.sh

branches=$(git branch --format="%(refname:short)")
echo $branches

git_status_all_branches () {
	print_pwd()
	for branch in $branches; do
		git checkout $branch --quiet
		echo "--------------------------------------"
		if git status -v | grep --quiet "behind\|ahead\|diverged"; then
			echo -e "${red}This branch is not in sync with its remote${no_color}"
		fi
		git status -v
		echo ""
		git branch -vv --color=always | grep $branch --color=never
		echo "--------------------------------------"
	done
	git checkout ${current_branch} --quiet
	echo "###############################################"
	echo ""
}
