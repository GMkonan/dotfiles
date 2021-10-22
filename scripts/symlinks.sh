function create_symlinks {
########## Variables

# dotfiles directory
dir=~/.dotfiles

# old dotfiles backup directory
olddir=~/.dotfiles_old

# list of files/folders to symlink in homedir
files="zshrc gitconfig vimrc"

##########

# create dotfiles_old in homedir
#echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
#mkdir -p $olddir
#echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
#for file in $files; do
#    echo "Moving any existing dotfiles from ~ to $olddir"
#    mv ~/.$file ~/dotfiles_old/
#    echo "Creating symlink to $file in home directory."
#    ln -s $dir/$file ~/.$file
#done
ln -nsf "$PWD"/files/.zshrc ~/.zshrc
ln -nsf "$PWD"/files/.gitconfig ~/.gitconfig
ln -nsf "$PWD"/files/.vimrc ~/.vimrc
}