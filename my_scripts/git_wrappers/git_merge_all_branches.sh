for branch in $(git branch --format="%(refname:short)"); do
	echo $branch
	git switch $branch
	git merge;
done
