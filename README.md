# A collection of tools to ease movement in the console

## Up
allows to quickly go up in the hierarchy, instead of doing ` ../../..` do `up 3`

## go and goadd
allows to bookmark directories to then quickly access them

## fcd
A `cd` with the completion giving the full path to the current directory instead of just `.`

## install
### Zsh
```sh
# Bash completion
autoload bashcompinit
bashcompinit

# Scripts
source /home/damianyang/Script/go.sh
source /home/damianyang/Script/up.sh
source /home/damianyang/Script/fcd.sh
```
