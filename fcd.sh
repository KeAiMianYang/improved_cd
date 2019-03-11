fcd()
{
		cd "$1"
}

_fcd() 
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts=`pwd`

	if [[ $cur == /* ]]; then
		COMPREPLY=()
		return 0
	else
		COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )

		local escaped_single_qoute="'\''"
		local tmp=""
		for entry in ${COMPREPLY[@]}
		do
        tmp=$tmp"$entry\ "
		done
    COMPREPLY=("${tmp:0:-2}/")
		return 0
	fi
}
complete -o dirnames -o nospace -F _fcd fcd
