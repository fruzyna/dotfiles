# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment and startup programs
if [ -f ~/.bash_profile ]; then
	. ~/.bash_profile
fi

# User specific aliases and functions
if [ -f ~/.bash_aliases ]; then
	. ~/.bash_aliases
fi
