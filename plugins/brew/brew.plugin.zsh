if [ `uname -s` = "Darwin" ] && [ which brew > /dev/null 2>&1 ]; then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
fi
