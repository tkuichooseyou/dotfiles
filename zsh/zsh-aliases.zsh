# Global aliases
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g C='| wc -l'
alias -g H='| head'
alias -g L="| less"
alias -g N="| /dev/null"
alias -g S='| sort'
alias -g G='| grep' # now you can do: ls foo G something

# Functions
#
# (f)ind by (n)ame
# usage: fn foo
# to find all files containing 'foo' in the name
function fn() { pt -i -l -G=.*$1.* . }

alias yt='noglob yt'
function yt() {
  youtube-dl $1 -o '~/Movies/youtube/%(title)s.%(ext)s' &>/dev/null &
}

