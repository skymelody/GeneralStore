#!/usr/bin/sh

declare -a plugin_urls=(
"https://github.com/preservim/nerdtree"
"https://github.com/vim-airline/vim-airline"
"https://github.com/vim-airline/vim-airline-themes"
"https://github.com/ycm-core/YouCompleteMe"
)

echo "plugins install begin"

plugin_install_path_root="$HOME/.vim/pack/plugins/start"

cnt=0
for plugin in "${plugin_urls[@]}"
do 
  plugin_install_path="${plugin_install_path_root}/${plugin##*/}"

  if [ ! -d "$plugin_install_path" ]; then
    mkdir -p "$plugin_install_path"
    git clone "${plugin}" "${plugin_install_path}"
    echo -e "\033[32mplugin: ${plugin##*/} installed!\033[0m"
    cnt=$((cnt+1))
  fi
done

echo -e "plugins install end, installed \033[31m${cnt}\033[0m plugins"
