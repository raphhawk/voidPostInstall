[ -f $HOME/.zshrc ] && . $HOME/.zshrc

export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin

exec dbus-run-session startx
