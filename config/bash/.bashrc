for file in ${XDG_CONFIG_HOME:-$HOME/.config}/bash/{plugins,local}/*.bash; do
    source "$file"
done
unset file
