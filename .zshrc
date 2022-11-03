. ~/.zsh_prompt

export PS1="%F{green}%n@%m%f:%F{blue}%~%f$ " # username@machinename:(green)[currentdir]$ 
export TERM="xterm-256color"

export GO111MODULE=on
export GOPATH=$HOME/go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH="/Users/toutane/.deno/bin:$PATH"
export PATH=/usr/local/bin:$PATH
