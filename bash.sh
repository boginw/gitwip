# pushes to current branch
push() {
	BRANCH=$(git rev-parse --abbrev-ref HEAD)
	git push origin $BRANCH
}

# commit and maybe remove WIP commit
commit() {
	git commit -m "$1"

	# merges last and current commit together
	if [[ $(git log -1 --skip 1 --pretty=%B) = "WIP" ]]; then
		BRANCH=$(git rev-parse --abbrev-ref HEAD)
		CURRENT=$(git rev-parse HEAD)
		BEFORE=$(git rev-parse HEAD~1)
		git checkout $CURRENT
		git reset --soft $BEFORE
		git commit --amend -m "$1"
		TARGET=`git rev-list HEAD --max-count=1`
		git checkout $BRANCH
		git rebase -s ours --onto $TARGET $CURRENT
	fi
}

# push a work-in-progress commit
wip() {
	git add .
	commit "WIP"
	push
}
