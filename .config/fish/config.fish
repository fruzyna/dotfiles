# custom greeting
function fish_greeting
	date
	echo
end
funcsave fish_greeting

# aliases
alias la="ls -A"
alias ll="ls -lA"
alias lr="ls -rA"

alias show="pass show"
alias copy="pass show -c"

# machines
set -x elmago "liam@192.168.1.35"
set -x rossy "mail929@192.168.1.31"
set -x benny "mail929@192.168.1.32"
set -x vpn "pi@192.168.1.36"
set -x astrobin "root@192.168.1.37"
set -x rajai "root@192.168.1.38"
