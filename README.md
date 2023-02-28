add theme and plugins to zsh automatically

change terminal theme automatically

install flameshot automatically

install tandem automatically

install 1password automatically?

If you are having problems with permissions don't forget to run the install script with `sudo`
```
sudo install.sh
```
It's not a good idea to have sudo inside a script. Instead, you can run the script itself with sudo if you need special permissions for the script's commands.


### Testing...
If you want to test it you can do it with docker
```
docker run -it ubuntu

apt-get update

apt-get install -y git

git clone https://github.com/GMkonan/dotfiles

cd dotfiles && ./install.sh

```