function aptinstall() {
    apt-cache search . | awk '{print $1}' | fzf --multi --preview 'apt-cache show {1}' | xargs -ro sudo apt install
}

function aptremove() {
    dpkg --get-selections | grep -v deinstall | awk '{print $1}' | fzf --multi --preview 'apt-cache show {1}' | xargs -ro sudo apt remove
}

