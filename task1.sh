#!/bin/bash


#account creation

read -p "enter your name to create account : " user_name
read -p "enter any number between 1000 to 60000 for uid : " u_id
read -p "enter any number between 1000 to 60000 for gid : " g_id
read -p "enter your phone number : " pho_ne
read -p "enter your pin-code : " pin_co
read -p "which shelltype do you want (/bin/bash or /sbin/nologin) : " shell_type

#password policy

read -p "how many days required for minimum days for passwd : " mini
read -p "how many days required for maximum days for passwd : " maxi
read -p "how many days required for warning for passwd : " warn
read -p "how many days required for inactive for passwd : " in_act
read -p "how many days required for expire a account,it should be in yy-mm-dd format :  " ex_pire

useradd $user_name
usermod -u $u_id $user_name
groupmod -g $g_id $user_name
usermod -s $shell_type $user_name

comment="PHONE "$pho_ne"  PIN-CODE "$pin_co""
usermod -c "$comment" "$user_name"

chage -m $mini $user_name
chage -M $maxi $user_name
chage -W $warn $user_name
chage -I $in_act $user_name
chage -E $ex_pire $user_name

echo "user $user_name account has been successfully created!!!!"