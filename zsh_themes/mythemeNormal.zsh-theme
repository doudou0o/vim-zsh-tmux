function prompt_char {
	if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}


PROMPT='%(!.%{$fg_bold[red]%}.%{$fg_bold[magenta]%}doudou0o@) %{$fg_bold[blue]%}%(!.%1~.%c)$(prompt_char)%{$reset_color%} '
#PROMPT='%(!.%{$fg_bold[red]%}.%{$fg_bold[magenta]%}%n@)%m %{$fg_bold[blue]%}%(!.%1~.%c)$(prompt_char)%{$reset_color%} '
