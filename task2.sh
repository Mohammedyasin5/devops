#!/bin/bash

# packages=$(cat "eg.txt")

# if [ `apt list --installed | grep $packages`]
# then
#     echo "Packages are already installed"
# else
#     apt install -y $packages
# fi

#!/bin/bash

# Read the packages from the file
packages=$(cat "eg.txt")

# Check if all packages are already installed
if dpkg -l | grep -qw $packages; then
    echo "Packages are already installed"
else
    sudo apt install -y $packages
    echo "$packages are installed"
fi
