# path, the 0 in the filename causes this to load first
path=(
  $GEM_HOME/bin
  /usr/local/opt/openssl/bin
  $path
  $HOME/.yadr/bin
  $HOME/.yadr/bin/yadr
  $HOME/.rvm/bin
  $HOME/go/bin
  $HOME/homebrew/bin
  $HOME/bin
  $HOME/bin/flash_aml_mac
)

LD_LIBRARY_PATH=(
  $HOME/homebrew/lib
)
