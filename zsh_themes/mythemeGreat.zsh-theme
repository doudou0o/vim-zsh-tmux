function prompt_char {
	if [ $UID -eq 0 ]; then echo "#"; else echo $; fi
}
function put_spacing() {
    local termwidth
    termwidth = ${COLUMNS} - 3 - ${git}
    termwidth = 10
    local spacing=""
    for i in {1..$termwidth}; do
            spacing="${spacing} "
    done
    echo $spacing
}

PROMPT='$fg_bold[green]%n@%m: $fg_bold[blue]$%~  %t$put_spacing$fg_bold[red]$(git_prompt_info)
$reset_color$> '



#PROMPT='%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n@)%m %{$fg_bold[blue]%}%(!.%1~.%~) $(git_prompt_info)%_$(prompt_char)%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=") "
