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


PROMPT='%(!.%{$fg_bold[red]%}.%{$fg_bold[green]%}%n@)%m %{$fg_bold[blue]%}%(!.%1~.%~)$(prompt_char)    $fg[cyan]%t
$reset_color$> '



ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=") "
