if [ ! -d ~/.shortcuts ]; then
	mkdir ~/.shortcuts
fi

go(){
		shortcuts=~/.shortcuts/
		if [ $# -eq 0 ]; then
				echo "$0 [-r] <shorcut>"
		elif [ $1 = "-l" ]; then
				ls -o $shortcuts
		elif [ $1 = "-r" ]; then
				unlink $shortcuts$2
		else
				previousCD=`pwd`
				#cd `~/Script/go_shortcut.sh $1`
				cd $shortcuts$1
				cd `pwd -P`
				currentCD=`pwd`
				cd $previousCD
				cd $currentCD
				echo `pwd`
		fi
}

goadd(){
		shortcuts=~/.shortcuts/
		if [ $# -eq 0 ]; then
				echo "$0 [<folder_to_link>] <shortcut>"
		else
				pathname=$1
				linkname=$2
				if [ $# -eq 1 ]; then
						pathname=.
						linkname=$1
				fi
				# if the first character of the folder to link is "~" or "/"
				if [ ${1:0:1} = "~" -o ${1:0:1} = "/" ]; then
						realpath=$pathname
						#ln -s $1 $shortcuts$2
				else
						realpath=`pwd`/$pathname
				fi
#				if [[ "$2" == */* ]]; then
#						echo "val $2"
#						arrIN=(${2//\// })
#						numDir=$((${#arrIN[@]} - 1))
#						echo $numDir
#						for i in $(seq 0 $numDir)
#						do
#							echo $i
#							val=${arrIN[$i]}
#							if [ ! -d $shortcuts$val ]; then
#								mkdir $shortcuts$val
#							fi
#						done

#						oldIFS=$IFS
#						for i in ${array[@]} do
#
#						done
				#fi
				ln -s "$realpath" "$shortcuts$linkame"
		fi
}
						#IFS='/' read -ra array <<< $2
						

_go() 
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts=`ls ~/.shortcuts/`

    COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    return 0
}
complete -F _go go
