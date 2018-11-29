mkdir -p ~/.vimbundles && cd ~/.vimbundles

get_bundle() {
  (
  if [ -d "$2" ]; then
    echo "Updating $1's $2"
    cd "$2"
    git pull --rebase
  else
    git clone "git://github.com/$1/$2.git"
  fi
  )
}

get_bundle pangloss vim-javascript
get_bundle mxw vim-jsx
get_bundle tpope vim-commentary
get_bundle tpope vim-fugitive
get_bundle w0rp ale
get_bundle prettier vim-prettier

vim -c 'call pathogen#helptags()|q'
