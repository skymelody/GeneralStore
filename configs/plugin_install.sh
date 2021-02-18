#!/usr/bin/sh

declare -a plugin_urls=(
"https://github.com/preservim/nerdtree"
"https://github.com/vim-airline/vim-airline"
"https://github.com/vim-airline/vim-airline-themes"
)

echo "plugins install begin"

plugin_install_path_root="$HOME/.vim/pack/plugins/start"
declare -a plugin_install_paths=()

for plugin in "${plugin_urls[@]}"
do 
  plugin_install_path="${plugin_install_path_root}/${plugin##*/}"
  plugin_install_paths+=("${plugin_install_path}")

  if [ ! -d "$plugin_install_path" ]; then
    mkdir -p "$plugin_install_path"
  fi
done


index=0
for plugin in "${plugin_urls[@]}"
do
  git clone "${plugin_urls[${index}]}" "${plugin_install_paths[${index}]}"
  index=$((index+1))
done

echo "plugins install end"
