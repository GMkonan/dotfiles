# try installing all apps using only apt or curl
# (maybe curl can be added to environment to make this more automatically)
function install_apt_get_apps {
    renew_sudo

    # get spotify to repo
    curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

    # vscode needs to be added to repo so you can install with apt, or go to snap

    apt-get install google-chrome spotify-client code
}

function install_snap_apps {

}