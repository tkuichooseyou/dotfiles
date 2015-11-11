let vimsettings = '~/.vim/settings'
let uname = system("uname -s")

nnoremap ,i :set invpaste paste?<CR>
set pastetoggle=,i
set showmode
set clipboard=unnamed

for fpath in split(globpath(vimsettings, '*.vim'), '\n')

  if (fpath == expand(vimsettings) . "/yadr-keymap-mac.vim") && uname[:4] ==? "linux"
    continue " skip mac mappings for linux
  endif

  if (fpath == expand(vimsettings) . "/yadr-keymap-linux.vim") && uname[:4] !=? "linux"
    continue " skip linux mappings for mac
  endif

  exe 'source' fpath
endfor
