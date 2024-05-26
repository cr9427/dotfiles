# append a item to a list like PATH
#
appList() {
   if [ -d $2 ] || [ -L $2 ]; then
      eval "lst=\${$1}"
      sep=${3:-:}

      case "${sep}${lst}${sep}" in

	 *${sep}${2}${sep}*)
	    ;;

	 ${sep}${sep})
	    eval "${1}=${2}"
	    ;;

	 *${sep}${sep})
	    eval "${1}=${lst}${2}${sep}"
	    ;;

	 *)
	    eval "${1}=${lst}${sep}${2}"
	    ;;
      esac
   fi
}

# prepend a item to a list like PATH
preList() {
   if [ -d $2 ] || [ -L $2 ]; then
      eval "lst=\${$1}"
      sep=${3:-:}
 
      case "${sep}${lst}${sep}" in
 
	 *${sep}${2}${sep}*)
	    ;;
 
	 ${sep}${sep})
	    eval "${1}=${2}"
	    ;;
 
	 ${sep}${sep}*)
	    eval "${1}=${sep}${2}${lst}"
	    ;;
 
	 *)
	    eval "${1}=${2}${sep}${lst}"
	    ;;
      esac
   fi
}
