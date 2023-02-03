#/bin/bash
fileList=(.gitconfig .npmrc .spacemacs .zshrc)
for file in ${fileList[*]}; do
    # file exist regardless of type
    # https://stackoverflow.com/questions/5767062/how-to-check-if-a-symlink-exists
    dir=${HOME}/${file}
    gitDir=${HOME}/.dotfiles/${file}
    echo $dir
    if [ -L $dir ]
    then
        rm $dir
    fi
    ln -s $gitDir $dir
done
