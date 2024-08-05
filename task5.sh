#!/bin/bash


# yas_update (){

# for package in $1
# do
#     if [apt list --installed | grep $package]
#     then
#         continue
#     else
#         apt remove --purge $package -y
#         apt autoremove -y
#     fi
# done
# }

# yas_update $1 htop tmux

#!/bin/bash

yas_update () {
    packages="$1"

    for package in $packages
    do
        if dpkg -l | grep -qw "$package"; then
            echo "$package is already installed, skipping installing...."
            continue
        else
            echo "$package is not installed, attempting installing...."
            sudo apt install  "$package" -y
        fi
    done
}

# Construct the list of packages from the script arguments
yas_update "htop tmux vsftpd"
