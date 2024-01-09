#!/bin/bash
show_menu(){
    normal="\033[m"
    menu="\033[36m" #Blue
    number="\033[33m" #yellow
    fggreen="\e[92m"
    fgred="\033[31m"

    version="0.1"

    mitems=(
           "Bad Reputation IPs"
           "Paste Services DNS"
           "Bad Reputation DNS Lookup"
           "Attempt to Find AWS Credentials"
           "Compliler Execution"
           "Container Management Utility (kubectl)"
           "Cryptominer"
           "Modify User Password (Ubuntu)"
           "Malware"
           "Network Scan"
           "Network Sniffing"
           "Reverse shell"
           )

    edir='/app/scenarios/'

    eitems=(
           "network/bad_reputation_dns_lookup.sh"
           "network/bad_reputation_ip.sh"
           "network/paste_services_dns.sh"
           "process/attempt_find_aws_credentials.sh"
           "process/compiler_execution.sh"
           "process/container_management_utility.sh"
           "process/cryptominer.sh"
           "process/local_account_password_modification.sh"
           "process/malware.sh"
           "process/network_scan.sh"
           "process/network_sniffing.sh"
           "process/reverse_shell.sh"
           )

    numitems=${#mitems[@]}

    printf "${fgred}V${version}${normal}\n"
    printf "\n${menu}     Select one of the following ${normal}\n"
    printf "\n${menu}*********************************************${normal}\n"

    for (( i=1; i<=numitems; i++ ))
    do
        j=$((i - 1))
        printf "${menu}**${number} ${i})${menu} ${mitems[$j]} ${normal}\n"
    done

    printf "\n"
    printf "${menu}**${number} a)${menu} Automatically run random scripts${normal}\n"
    printf "\n"
    printf "${menu}**${number} e)${menu} Exit to Container shell${normal}\n"
    printf "${menu}**${number} x)${menu} Exit Container${normal}\n"
    printf "${menu}*********************************************${normal}\n"
    printf "Please enter a menu option and enter: "
    read opt
}

after_exec(){
    read -p "Press enter to continue";
    clear;
    show_menu;
}

option_picked(){
    msgcolor="\033[01;31m" # bold red
    normal="\033[00;00m" # normal white
    message=${*:-"${normal}Error: No message passed"}
    printf "${msgcolor}${message}${normal}\n"
}

validate_numerical_option(){
    # checks if $opt is a valid numerical option (if numerical)
    [[ $1 =~ ^[0-9]+$ ]] && [[ $1 -le $numitems && $1 -ge 1 ]]
}

clear
show_menu
while true
do
    if [ "$opt" = '' ]; then
        exit;
    else
        # Handle numerical options
        if validate_numerical_option "$opt"; then
            clear;
            m=$opt-1
            option_picked "$opt - ${mitems[$m]}"
            $edir${eitems[$m]};
            after_exec;
        else
            case $opt in
                a)
                    clear;
                    option_picked "This script will automatically generate random events at random interval (30 minutes max). Type <Ctrl-C> to return to menu";
                    ./auto.sh;
                    show_menu;
                ;;

                e)
                    clear;
                    option_picked "Type exit to return to menu";
                    /bin/bash;
                    show_menu;
                ;;

                x|q)
                    exit;
                ;;

                '\n')
                    exit;
                ;;

                *)
                    option_picked "Pick a valid option from the menu";
                    show_menu;
                ;;
            esac
        fi
    fi
done
