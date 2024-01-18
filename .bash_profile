# Set langauge just in case
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export EDITOR=vim
export CLICOLOR=1
export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig:/usr/local/lib:/usr/local/opt/libpng/lib/pkgconfig/:/usr/local/opt/freetype/lib/pkgconfig/:/usr/local/opt/fontconfig/lib/pkgconfig/:/usr/local/opt/libxml2/lib/pkgconfig:/usr/local/opt/libiconv/lib/pkgconfig"

alias postgresql_start="pg_ctl -D ${HOME}/postgres -l logfile start"
alias postgresql_stop="pg_ctl -D ${HOME}/postgres -l logfile stop"
alias h=history
alias c=clear
alias la='ls -al'
alias tree="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
alias less='less -R'
alias grep='grep --color=auto --exclude-dir=.git --exclude-dir=log --exclude-dir=vendor'
alias ag='ag --ignore-dir=.git --ignore-dir=log --ignore-dir=vendor --ignore-dir=build --ignore-dir=dist --ignore-dir=node_modules'

if [ -d "/opt/homebrew/opt/curl" ]; then
  export LDFLAGS="-L/opt/homebrew/opt/curl/lib"
  export CPPFLAGS="-I/opt/homebrew/opt/curl/include"
  export PKG_CONFIG_PATH="/opt/homebrew/opt/curl/lib/pkgconfig:$PKG_CONFIG_PATH"
fi

if [ -d "$HOME/.pyenv" ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

function jdk() {
  version=$1
  export JAVA_HOME=$(/usr/libexec/java_home -v"$version");
  java -version
}

jdk 1.8
export PATH="$JAVA_HOME/bin:$HOME/bin:/opt/homebrew/opt/libtool/libexec/gnubin:$PATH"

eval "$(/opt/homebrew/bin/brew shellenv)"
