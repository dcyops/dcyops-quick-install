
# Totally stole this from https://github.com/nnsee. 
# Thank you, kind stranger <3

_SHINCLUDES_PATH="$(dirname $(readlink -f "${(%):-%x}"))"

for includefile in "${_SHINCLUDES_PATH}/source/"*; do
   . "$includefile"
done

fpath=( ${_SHINCLUDES_PATH}/autoload "${fpath[@]}" )
autoload -Uz ${_SHINCLUDES_PATH}/autoload/*(.:t)

unset _SHINCLUDES_PATH
