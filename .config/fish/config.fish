# aliases
alias ll="ls -lA"
alias cat="cat -n"
alias grep="grep -In --color"
alias igrep="grep -Ini --color"

alias log="git log --pretty=format:'%C(yellow)%h %C(blue)%ad %C(green)%an%Creset%x09%s%(decorate:pointer= ,separator= ,prefix=%n,suffix)' --date=short -10"
alias summary="git config --get remote.origin.url; echo "----------"; git status -s | command grep -v ??; echo "----------"; git log --pretty=format:'%C(yellow)%h %C(blue)%ad %C(green)%an%Creset%x09%s%(decorate:pointer= ,separator= ,prefix=%n,suffix)' --date=short -10"
