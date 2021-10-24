# consider creating a "install_curl" function

function install_node {
    renew_sudo
    curl -sL https://deb.nodesource.com/setup_16.x -o nodesource_setup.sh
    bash nodesource_setup.sh
    apt install nodejs
}

function install_docker {
    apt-get install docker.io
    apt-get install docker-compose
}