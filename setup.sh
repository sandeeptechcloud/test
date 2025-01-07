#!/bin/bash

#<<<----------Colour substitution by variables---------->>>
B0="$(printf '\033[100m')" S0="$(printf '\033[30m')"
B1="$(printf '\033[101m')" S1="$(printf '\033[31m')"
B2="$(printf '\033[102m')" S2="$(printf '\033[32m')"
B3="$(printf '\033[103m')" S3="$(printf '\033[33m')"
B4="$(printf '\033[104m')" S4="$(printf '\033[34m')"
B5="$(printf '\033[105m')" S5="$(printf '\033[35m')"
B6="$(printf '\033[106m')" S6="$(printf '\033[36m')"
B7="$(printf '\033[107m')" S7="$(printf '\033[37m')"
R1="$(printf '\033[0;1m')" R0="$(printf '\033[00m')"

#<<<----------BANNER--------->>>
echo
wait() {
    sleep 0.02
}

printf "${S7}╔═══╦╗        ╔╗╔═╦╗${R0}\n"; wait
printf "${S6}║╔═╗║║        ║║║╔╣║${R0}\n"; wait
printf "${S2}║║ ╚╣║╔══╦╗╔╦═╝╠╝╚╣║╔══╦═╦══╗${R0}\n"; wait
printf "${S2}║║ ╔╣║║╔╗║║║║╔╗╠╗╔╣║║╔╗║╔╣║═╣${R0}\n"; wait
printf "${S3}║╚═╝║╚╣╚╝║╚╝║╚╝║║║║╚╣╔╗║║║║═╣${R0}\n"; wait
printf "${S1}╚═══╩═╩══╩══╩══╝╚╝╚═╩╝╚╩╝╚══╝${R0}${B5}${S2} INSTALLER ${R0}${R1}\n"; wait
echo; wait
printf "${S1}Authored by:- Sandeep Tech ~SANDEEP${R0}\n"; wait
echo
sleep 3

#<<----Downloader function---->>#
WGET() {
    while true; do
        wget -q $1
        if [ "$?" -eq 0 ]; then
            break
        else
            printf "\n${S2}Check your Internet connection${R0}\n\n"
        fi
    done
}

#<<<<<--------WINDOWS------>>>>>
_win64_() {
    cd /usr/bin
    WGET "https://github.com/cloudflare/cloudflared/releases/download/2024.12.2/cloudflared-windows-amd64.exe"
    mv cloudflared-windows-amd64.exe cloudflare.exe
}
_win32_() {
    WGET "https://github.com/cloudflare/cloudflared/releases/download/2024.12.2/cloudflared-windows-386.exe"
    mv cloudflared-windows-386.exe cloudflare.exe
}

#<<<<<--------LINUX-------->>>>>
#<<----aarch64---->>
__aarch64__() {
    cd $HOME
    WGET "https://github.com/cloudflare/cloudflared/releases/download/2024.12.2/cloudflared-linux-arm64"
    mv cloudflared-linux-arm64 cloudflare
    chmod +x cloudflare
}

#<<----aarch32----->>
__aarch32__() {
    cd $HOME
    WGET "https://github.com/cloudflare/cloudflared/releases/download/2024.12.2/cloudflared-linux-arm"
    mv cloudflared-linux-arm cloudflare
    chmod +x cloudflare
}

#<<----32bit---->>
__32bit__() {
    cd $HOME
    WGET "https://github.com/cloudflare/cloudflared/releases/download/2024.12.2/cloudflared-linux-386"
    mv cloudflared-linux-386 cloudflare
    chmod +x cloudflare
}

#<<----amd64---->>
__amd64__() {
    cd $HOME
    WGET "https://github.com/cloudflare/cloudflared/releases/download/2024.12.2/cloudflared-linux-amd64"
    mv cloudflared-linux-amd64 cloudflare
    chmod +x cloudflare
}

#####################################<<INSTALLATION>>##########################################

OS=$(uname -o)
archit=$(uname -m)

#<<<----------ANDROID---------->>>
if [[ ${OS^^} == *'ANDROID'* ]]; then
    apt update && apt upgrade -y
    apt install git wget curl findutils proot unzip -y
    sleep 2
    cd $HOME
    distro=$(pwd)
    rm -rf *ngrok*
    if [[ ${distro} == *'com.termux'* ]]; then
        if [[ -f "$PREFIX/bin/cloudflare" ]]; then
            rm -rf $PREFIX/bin/cloudflare
        fi
        echo; wait
        printf "${S2}YOU ARE USING ${S7}     ╔════╗${R0}\n"; wait
        printf "                   ${S3}║╔╗╔╗║${R0}\n"; wait
        printf "                   ${S3}╚╝║║╠╩═╦═╦╗╔╦╗╔╦╗╔╗${R0}\n"; wait
        printf "                   ${S2}  ║║║║═╣╔╣╚╝║║║╠╬╬╝${R0}\n"; wait
        printf "                   ${S6}  ║║║║═╣║║║║║╚╝╠╬╬╗${R0}\n"; wait
        printf "                   ${S1}  ╚╝╚══╩╝╚╩╩╩══╩╝╚╝ !! :)${R0}\n"; wait
        echo; wait
        printf "${S3}DOWNLOADING CLOUDFLARE....${R0}\n"; wait
        echo
        if [[ ${archit^^} == *'AARCH64'* || ${archit^^} == *'ARMV8'* ]]; then
            __aarch64__
        elif [[ ${archit^^} == *'AARCH32'* || ${archit^^} == *'ARMV7'* ]]; then
            __aarch32__
        elif [[ ${archit^^} == *'386'* || ${archit^^} == 'X86' || ${archit^^} == *'686'* || ${archit^^} == *'X86_32'* || ${archit^^} == 'AMD' ]]; then
            __32bit__
        elif [[ ${archit^^} == *'X86_64'* || ${archit^^} == *'AMD64'* ]]; then
            __amd64__
        else
            echo
            printf "${S5}THIS INSTALLER IS NOT FOR YOUR SYSTEM! PLEASE INSTALL ${B3}cloudflare${R1} MANUALLY!!${R0}\n"
            echo
            exit 1
        fi
        printf "${S6}INSTALLING CLOUDFLARE IN YOUR SYSTEM!! :)${R0}\n"
        echo
        mv -v ${HOME}/cloudflare $PREFIX/bin
        echo
        printf "${S4}${B1}cloudflare${R1} IS INSTALLED IN YOUR SYSTEM ~SUCCESSFULLY!! :)${R0}\n"
        echo
    fi
fi

#<<<----------LINUX---------->>>
elif [[ ${OS^^} == *'LINUX'* ]]; then
    sudo apt update && sudo apt upgrade -y
    sudo apt install git wget curl findutils unzip -y
    sleep 2
    cd $HOME
    rm -rf *cloudflare*
    sbingrok=$(sudo find /bin /usr/bin /sbin -type f -name "cloudflare" 2>/dev/null)
    if [ -n "$sbingrok" ]; then
        sudo rm -rf $(which cloudflare)
    fi
    echo
    printf "${S3}DOWNLOADING CLOUDFLARE....${R0}\n"; wait
    echo
    if [[ ${archit^^} == *'AARCH64'* || ${archit^^} == *'ARMV8'* ]]; then
        __aarch64__
    elif [[ ${archit^^} == *'AARCH32'* || ${archit^^} == *'ARMV7'* ]]; then
        __aarch32__
    elif [[ ${archit^^} == *'386'* || ${archit^^} == 'X86' || ${archit^^} == *'686'* || ${archit^^} == *'X86_32'* || ${archit^^} == 'AMD' ]]; then
        __32bit__
    elif [[ ${archit^^} == *'X86_64'* || ${archit^^} == *'AMD64'* ]]; then
        __amd64__
    else
        echo
        printf "${S5}THIS INSTALLER IS NOT FOR YOUR SYSTEM! PLEASE INSTALL ${B3}cloudflare${R1} MANUALLY!!${R0}\n"
        echo
        exit 1
    fi
    printf "${S6}INSTALLING CLOUDFLARE IN YOUR SYSTEM!! :)${R0}\n"
    mv -v ${HOME}/cloudflare /usr/bin
    echo
    printf "${S4}${B1}cloudflare${R1} IS INSTALLED IN YOUR SYSTEM ~SUCCESSFULLY!! :)${R0}\n"
    echo
fi

#<<<--------EXIT-------->>>#
wait
exit
