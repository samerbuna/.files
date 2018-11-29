git config --global alias.a "add -A"
git config --global alias.ap "add --patch"
git config --global alias.b "branch"
git config --global alias.br "branch -v"
git config --global alias.c "commit"
git config --global alias.ca "commit -a"
git config --global alias.amend "commit --amend"
git config --global alias.cne "commit --amend --no-edit"
git config --global alias.co "checkout"
git config --global alias.cp "cherry-pick"
git config --global alias.nb "checkout -b"
git config --global alias.uncommit "reset --soft HEAD^"
git config --global alias.unstage "reset HEAD"
git config --global alias.where "branch -a --contains"

git config --global alias.d "diff"
git config --global alias.ds "diff --staged"

git config --global alias.s "status -sb"
git config --global alias.st "status"

git config --global alias.filelog "log -u"
git config --global alias.short "log --pretty=format:\"%h %cr %cn %Cgreen%s%Creset\""
git config --global alias.l "log --decorate --graph --date=short"

git config --global alias.r "remote -v"

git config --global alias.sa "stash apply"
git config --global alias.sp "stash pop"
git config --global alias.sl "stash list"
git config --global alias.ss "stash save"

git config --global color.branch auto
git config --global color.diff auto
git config --global color.interactive auto
git config --global color.status auto
git config --global color.grep auto

git config --global push.default current
