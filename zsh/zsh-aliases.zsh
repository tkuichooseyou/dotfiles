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

function pat() {
  USER_ID=$1
  ENDPOINT=$2
  VERSION=$3
  if [ -n "$3" ]
  then
    VERSION='dev'
  fi
  export TRANSLATOR_TOKEN='eiChai3rJein2aiSEiToong6ahtho4Ho'
  export PAT=$(curl -sSd '{"customer_id":'$USER_ID',"client_id":2,"partner_id":72057594037927937,"expires_in":108000}' http://fake-authority-test.dev.citadelapps.com/token | jq -r .token)

  echo $PAT
}

function mat() {
  IVCERT=`uuidgen | tr -d '-' | cut -c 1-32`

  EMAIL="$1@mercari.com"
  PASSWORD=$2
  if [ -n "$2" ]
  then
    PASSWORD="password"
  fi
  if [ -n "$2" ]
  then
    PASSWORD="password"
  fi


  REFRESH_TOKEN=`curl -s -v -X POST -H 'X-APP-VERSION: 24821' -H 'X-Platform: ios' -H 'Authorization: $MAT' -H 'Accept: application/json' -H 'User-Agent: Mercari_r/24821' \
    -F "uuid=$IVCERT" https://api-jp.fury-panda.dev5s.com/auth/refresh_token | egrep -o '"refresh_token":"(\w+)"' | cut -d '"' -f 4 `

  MAT=`curl -s -v -X POST -H 'X-APP-VERSION: 24821' -H 'X-Platform: ios' -H 'Authorization: $MAT' -H 'Accept: application/json' -H 'User-Agent: Mercari_r/24821'  \
    -F "uuid=$IVCERT" -F "refresh_token=$REFRESH_TOKEN" https://api-jp.fury-panda.dev5s.com/auth/access_token |   egrep -o '"access_token":"2:\w+"' | cut -d '"' -f 4  `

  echo "MAT: $MAT"

   curl -v -X POST -H "X-App-Version: 99999" -H "X-Platform: ios" -H "Authorization: $MAT" \
  -F "email=$EMAIL" -F "password=$PASSWORD" -F "iv_cert=$IVCERT" \
  'https://api-jp.fury-panda.dev5s.com/users/login'
}

function fix_mosh_server() {
  local fw='/usr/libexec/ApplicationFirewall/socketfilterfw'
  local mosh_sym="$(which mosh-server)"
  local mosh_abs="$(greadlink -f $mosh_sym)"

  sudo "$fw" --setglobalstate off
  sudo "$fw" --add "$mosh_sym"
  sudo "$fw" --unblockapp "$mosh_sym"
  sudo "$fw" --add "$mosh_abs"
  sudo "$fw" --unblockapp "$mosh_abs"
  sudo "$fw" --setglobalstate on
}
