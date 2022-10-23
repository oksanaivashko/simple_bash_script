#!/bin/bash

# creates directory and change directory to a new file.

mcd () {
    mkdir -p "$1"
    cd "$1"
}

mcd oksana_testing

user () {
    echo "Hello $(whoami) This is a funtion"
    echo "Bye"
}


create_user () {
    usr="$1"
    pass="$2"
    uid="$3"

    useradd $usr -u $uid -p $pass
    cat /etc/passwd | grep $usr
}