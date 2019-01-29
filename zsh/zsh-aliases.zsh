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
function fn() {
  rg --files . --iglob *$1* | fpp
}

alias yt='noglob yt'
function yt() {
	youtube-dl -f 'bestvideo[ext=mp4][height <=? 720]+bestaudio[ext=m4a]/mp4' $1 -o '~/Movies/youtube/%(title)s.%(ext)s' &>/dev/null &
}

function ytlist() {
  youtube-dl -f 'bestvideo[ext=mp4][height <=? 720]+bestaudio[ext=m4a]/mp4' $1 -o '~/Movies/youtube/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s'
}

function gif() {
  gifify -r 30@2 -p 215:447 $1
}
