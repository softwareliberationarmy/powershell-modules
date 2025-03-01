# suggested global config options from https://blog.gitbutler.com/how-git-core-devs-configure-git/

# show results in columns for more concise order
git config --global column.ui auto
# sort returned branches by committer date descending
git config --global branch.sort -committerdate

# sort returned tags by version number instead of true alphabetical order
git config --global tag.sort version:refname

# set default branch name to main
git config --global init.defaultBranch main

# change the default diff algorithm to histogram
git config --global diff.algorithm histogram

# show the color of moved code different from added code
git config --global diff.colorMoved plain

# change prefixes from /a and /b to /w(orktree) and /i(ndex)
git config --global diff.mnemonicPrefix true

# recognize renames in diffs
git config --global diff.renames true

# set default push behavior to simple
git config --global push.default simple # (default since 2.0)

# if remote branch doesn't exist when pushing, create it
git config --global push.autoSetupRemote true

# ensure local tags anywhere in the repo are pushed when pushing a branch
git config --global push.followTags true

# remove origin/x branch when x is gone from remote
git config --global fetch.prune true

# remove tags from local that are no longer in the remote
git config --global fetch.pruneTags true

# fetch all remote branches when fetching
git config --global fetch.all true


# set the default merge tool to zdiff3
# git config --global merge.conflictstyle zdiff3

# set git pull to always rebase
# git config --global pull.rebase true

