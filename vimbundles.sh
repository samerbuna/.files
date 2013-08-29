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

get_bundle altercation vim-colors-solarized
get_bundle bling vim-airline
get_bundle duff vim-bufonly
get_bundle godlygeek tabular
get_bundle gregsexton gitv
get_bundle jgdavey tslime.vim
get_bundle jgdavey vim-blockle
get_bundle jgdavey vim-turbux
get_bundle kchmck vim-coffee-script
get_bundle kien ctrlp.vim
get_bundle leshill vim-json
get_bundle nathanaelkane vim-indent-guides
get_bundle nono vim-handlebars
get_bundle pangloss vim-javascript
get_bundle tpope vim-abolish
get_bundle tpope vim-bundler
get_bundle tpope vim-classpath
get_bundle tpope vim-commentary
get_bundle tpope vim-endwise
get_bundle tpope vim-eunuch
get_bundle tpope vim-fugitive
get_bundle tpope vim-git
get_bundle tpope vim-markdown
get_bundle tpope vim-pathogen
get_bundle tpope vim-ragtag
get_bundle tpope vim-rails
get_bundle tpope vim-rake
get_bundle tpope vim-repeat
get_bundle tpope vim-sensible
get_bundle tpope vim-speeddating
get_bundle tpope vim-surround
get_bundle tpope vim-unimpaired
get_bundle vim-ruby vim-ruby
get_bundle wookiehangover jshint.vim

vim -c 'call pathogen#helptags()|q'
