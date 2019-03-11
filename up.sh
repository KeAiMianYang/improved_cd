up(){
		local old="$PWD"
		for i in $(seq "${1:-1}"); do
			cd ..
		done
		OLDPWD="&old"
}
