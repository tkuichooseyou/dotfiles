# Aliases in this file are bash and zsh compatible

# Don't change. The following determines where YADR is installed.
yadr=$HOME/.yadr

# Teddy
alias work='tmux attach -t work'
alias brews='brew update && brew upgrade && brew cleanup; brew doctor'
alias vim='nvim'
alias vims='vim -c VundleUpdate -c quitall'
alias keyboard='cd ~/repos/personal/fork/qmk_firmware/keyboards/ergodox_ez/keymaps/tkuichooseyou'
alias git='noglob git'
alias ag="echo 'use pt'"
alias play="vim ~/Library/Mobile\ Documents/iCloud\~com\~apple\~Playgrounds/Documents/alg-playground/leetcode-swift-google.playground/Pages/leetcode-swift-google.xcplaygroundpage/Contents.swift"

# display ddcctl
alias dim="ddcctl -d 1 -b 1 -c 60"
alias mid="ddcctl -d 1 -b 30 -c 60"
alias bright="ddcctl -d 1 -b 90 -c 60"
alias hdmi="ddcctl -d 1 -i 17"
alias usbc="ddcctl -d 1 -i 27"

# Get operating system
platform='unknown'
unamestr=$(uname)
if [[ $unamestr == 'Linux' ]]; then
  platform='linux'
elif [[ $unamestr == 'Darwin' ]]; then
  platform='darwin'
fi

# PS
alias psa="ps aux"
alias psg="ps aux | grep "
alias psr='ps aux | grep ruby'

# Moving around
alias cdb='cd -'
alias cls='clear;ls'

# Show human friendly numbers and colors
alias df='df -h'
alias du='du -h -d 2'

if [[ $platform == 'linux' ]]; then
  alias ll='ls -alh --color=auto'
  alias ls='ls --color=auto'
elif [[ $platform == 'darwin' ]]; then
  alias ll='ls -alGh'
  alias ls='ls -Gh'
fi

# show me files matching "ls grep"
alias lsg='ll | grep'

# Alias Editing
TRAPHUP() {
  source $yadr/zsh/aliases.zsh
}

alias ae='vim -O $yadr/zsh/aliases.zsh $yadr/zsh/zsh-aliases.zsh' #alias edit
alias ar='source $yadr/zsh/aliases.zsh && source $yadr/zsh/zsh-aliases.zsh'  #alias reload
alias path='vim $yadr/zsh/0_path.zsh'  #alias reload
alias gar="killall -HUP -u \"$USER\" zsh"  #global alias reload

# mimic vim functions
alias :q='exit'

# vimrc editing
alias ve='vim ~/.SpaceVim.d/init.toml'

# zsh profile editing
alias ze='vim ~/.zshrc'

# Common shell functions
alias less='less -r'
alias tf='tail -f'
alias l='less'
alias lh='ls -alt | head' # see the last modified files
alias screen='TERM=screen screen'
alias cl='clear'

# Gem install
alias sgi='gem install --no-ri --no-rdoc'

# Forward port 80 to 3000
alias portforward='sudo ipfw add 1000 forward 127.0.0.1,3000 ip from any to any 80 in'

alias prune='git remote prune origin && git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

# Finder
alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'

# teddy

# fasd extra aliases
alias v='f -e vim'
alias xvim1='rm -rf /Users/teddy/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins/XVim2.xcplugin && cp -R /Users/teddy/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins/xcode10.1/XVim2.xcplugin /Users/teddy/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins/'
alias xvim2='rm -rf /Users/teddy/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins/XVim2.xcplugin && cp -R /Users/teddy/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins/xcode10.2/XVim2.xcplugin /Users/teddy/Library/Application\ Support/Developer/Shared/Xcode/Plug-ins/'

    # removed --color
alias code2ebook='/Users/teddy/bin/code2ebook/src2html.pl --tab-width 4 --cross-reference --navigator --line-numbers'
    ## --authors --title
alias ebook-convert='ebook-convert html_out/index.html my-project.mobi --output-profile kindle --no-inline-toc --language en'
alias pdfcrop='/Users/teddy/bin/k2pdfopt -dev kv'
