# shellcheck disable=SC2207

# Requires https://github.com/scop/bash-completion

_bat() {
	local cur prev words cword split
	_init_completion -s || return 0

	if [[ ${words[1]-} == cache ]]; then
		case $prev in
		--source | --target)
			_filedir -d
			return 0
			;;
		esac
		COMPREPLY=($(compgen -W "
			--build --clear --source --target --blank --help
		" -- "$cur"))
		return 0
	fi

	case $prev in
	-l | --language)
		local IFS=$'\n'
		COMPREPLY=($(compgen -W "$(
			"$1" --list-languages | while IFS=: read -r lang _; do
				printf "%s\n" "$lang"
			done
		)" -- "$cur"))
		compopt -o filenames  # for escaping
		return 0
		;;
	-H | --highlight-line | --diff-context | --tabs | --terminal-width | \
	-m | --map-syntax | --style | --line-range | -h | --help | -V | \
	--version | --diagnostic | --config-file | --config-dir | \
	--cache-dir | --generate-config-file)
		# argument required but no completion available, or option
		# causes an exit
		return 0
		;;
	--file-name)
		_filedir
		return 0
		;;
	--wrap)
		COMPREPLY=($(compgen -W "auto never character" -- "$cur"))
		return 0
		;;
	--color | --decorations | --paging)
		COMPREPLY=($(compgen -W "auto never always" -- "$cur"))
		return 0
		;;
	--italic-text)
		COMPREPLY=($(compgen -W "always never" -- "$cur"))
		return 0
		;;
	--pager)
		COMPREPLY=($(compgen -c -- "$cur"))
		return 0
		;;
	--theme)
		local IFS=$'\n'
		COMPREPLY=($(compgen -W "$("$1" --list-themes)" -- "$cur"))
		compopt -o filenames  # for escaping
		return 0
		;;
	esac

	$split && return 0

	if [[ $cur == -* ]]; then
		COMPREPLY=($(compgen -W "
			--show-all --plain --language --highlight-line
			--file-name --diff --diff-context --tabs --wrap
			--terminal-width --number --color --italic-text
			--decorations --paging --pager --map-syntax --theme
			--list-themes --style --line-range --list-languages
			--help --version --force-colorization --unbuffered
			--diagnostic --config-file --config-dir --cache-dir
			--generate-config-file
		" -- "$cur"))
		return 0
	fi

	_filedir
	((cword == 1)) && COMPREPLY+=($(compgen -W cache -- "$cur"))

} && complete -F _bat bat
