let vimsettings = '~/.vim/settings'
let uname = system("uname -s")

nnoremap ,i :set invpaste paste?<CR>
set pastetoggle=,i
set showmode
set clipboard=unnamed

au BufNewFile,BufRead Fastfile setlocal ft=ruby

for fpath in split(globpath(vimsettings, '*.vim'), '\n')

  if (fpath == expand(vimsettings) . "/yadr-keymap-mac.vim") && uname[:4] ==? "linux"
    continue " skip mac mappings for linux
  endif

  if (fpath == expand(vimsettings) . "/yadr-keymap-linux.vim") && uname[:4] !=? "linux"
    continue " skip linux mappings for mac
  endif

  exe 'source' fpath
endfor

" https://robots.thoughtbot.com/faster-grepping-in-vim
" The Platinum Searcher
if executable('pt')
  " Use pt over grep
  set grepprg=pt\ --nogroup\ --nocolor

  " Use pt in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'pt %s -l --nocolor -g ""'

  " pt is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif
nnoremap \ :Pt<SPACE>

autocmd FileType swift setlocal shiftwidth=4 tabstop=4
