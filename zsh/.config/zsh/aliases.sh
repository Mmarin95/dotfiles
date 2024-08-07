alias v="$EDITOR"

alias ll='ls -lah'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gs='git status'
alias gd='git diff'

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

alias ..="cd .."

alias cdd="cd $DOTFILES"

# NVIM Aliases
alias :q=exit
alias lvim='nvim -c "normal '\''0"'
alias -g W='| nvim -c "setlocal buftype=nofile bufhidden=wipe" -c "nnoremap <buffer> q :q!<CR>" -' # "-" tells to read from stdin
alias -g A='| tee /tmp/nvim_buffer_input | sed -r "s/\x1b\[[0-9;]*m//g" > /tmp/nvim_buffer_cleaned && nvim -c "GpChatNew" -c "normal! Go" -c "r /tmp/nvim_buffer_cleaned" -c "normal! Gdd"'

alias oil='nvim -c Oil -c "nnoremap <buffer> q :q!<CR>"' 
alias Oil=oil

alias fgit='nvim -c "Git" -c "only" -c "nnoremap <buffer> q :qa!<CR>"'

