#!/bin/bash
#<<<----------colour substitution by variables---------->>>
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
printf "${S3}║╚═╝║╚╣╚╝║╚╝║╚╝║║║║╚╣╔╗║║║║═╣${Rp}\n"; wait
printf "${S1}╚═══╩═╩══╩══╩══╝╚╝╚═╩╝╚╩╝╚══╝${R0}${B5}${S2} INSTALLER ${R0}${R1}\n"; wait
echo; wait
printf "${S1}Authored by:- Suman Kumar ~BHUTUU${R0}\n"; wait
echo
sleep 3
#<<----Downloader function---->>#
WGET() {
  while true; do
    wget $1
    if [ "$?" == '0' ]; then
      break
    else
      printf "\n${S2}Check your Internet connection${R0}\n\n"
    fi
  done
}
#<<<<<--------LINUX/TERMUX-------->>>>>
__aarch64__() {
  cd $HOME
  WGET "https://github.com/cloudflare/cloudflared/releases/download/2021.10.3/cloudflared-linux-arm64"
  mv cloudflared-linux-arm64 cloudflared
  chmod +x cloudflared
}
__aarch32__() {
  cd $HOME
  WGET "https://github.com/cloudflare/cloudflared/releases/download/2021.10.3/cloudflared-linux-arm"
  mv cloudflared-linux-arm cloudflared
  chmod +x cloudflared
}
__32bit__() {
  cd $HOME
  WGET "https://github.com/cloudflare/cloudflared/releases/download/2021.10.3/cloudflared-linux-386"
  mv cloudflared-linux-386 cloudflared
  chmod +x cloudflared
}
__amd64__() {
  cd $HOME
  WGET "https://github.com/cloudflare/cloudflared/releases/download/2021.10.3/cloudflared-linux-amd64"
  mv cloudflared-linux-amd64 cloudflared
  chmod +x cloudflared
}
#####################################<<INSTALLATION>>##########################################
OS=$(uname -o)
archit=$(uname -m)
#<<<----------ANDROID/TERMUX---------->>>
if [[ ${OS^^} == *'ANDROID'* || ${OS^^} == *'TERMUX'* ]]; then
  # Install necessary packages in Termux
  pkg update && pkg upgrade -y
  pkg install git wget curl findutils proot unzip -y
  sleep 2
  cd $HOME
  rm -rf *cloudflare*
  
  if [[ ${archit^^} == *'AARCH64'* || ${archit^^} == *'ARMV8'* ]]; then
    __aarch64__
  elif [[ ${archit^^} == *'AARCH32'* || ${archit^^} == *'ARMV7'* ]]; then
    __aarch32__
  elif [[ ${archit^^} == *'386'* || ${archit^^} == 'X86' || ${archit^^} == *'686'* || ${archit^^} == *'X86_32'* || ${archit^^} == 'AMD' ]]; then
    __32bit__
  elif [[ ${archit^^} == *'X86_64'* || ${archit^^} == *'AMD64'* ]]; then
    __amd64__
  else
    printf "${S5}This installer is not for your system! Please install Cloudflare manually.${R0}\n"
    exit 1
  fi
  
  # Install cloudflared
  mv -v ${HOME}/cloudflared $PREFIX/bin
  printf "${S4}${B1}cloudflare${R1} is installed in your system successfully!${R0}\n"
fi

#<<<----------WINDOWS/MSYS---------->>>
elif [[ ${OS^^} == *'MSYS'* || ${OS^^} == *'WINDOWS'* ]]; then
  PREFIX="/usr"
  adminPerm=$(net user administrator | grep active | awk '{print $NF}')
  case ${adminPerm,,} in
    yes) opposite="no";;
    no) opposite="yes";;
    *) printf "Not possible to run this\n"; exit 1;;
  esac
  net user administrator /active:${opposite} >/dev/null 2>&1
  adminPerm=$(net user administrator | grep active | awk '{print $NF}')
  if [[ ${adminPerm,,} != "${opposite}" ]]; then
    printf "${S2}[${S1}!${S2}]${S4}Run this command prompt or shell in Administrator mode${R0}\n"
    exit 1
  fi

  echo; wait
  echo; wait
  echo -e "${S2}YOU ARE USING: ${R0}\n"; wait
  printf "${S7}██████          ██████ ██████████ ██████          ██████ ████████████   ██████████████ ██████          ██████ ██████████████ ${R0}\n"; wait
  printf "${S7}██░░██          ██░░██ ██░░░░░░██ ██░░██████████  ██░░██ ██░░░░░░░░████ ██░░░░░░░░░░██ ██░░██          ██░░██ ██░░░░░░░░░░██ ${R0}\n"; wait
  printf "${S3}██░░██          ██░░██ ████░░████ ██░░░░░░░░░░██  ██░░██ ██░░████░░░░██ ██░░██████░░██ ██░░██          ██░░██ ██░░██████████ ${R0}\n"; wait
  printf "${S3}██░░██          ██░░██   ██░░██   ██░░██████░░██  ██░░██ ██░░██  ██░░██ ██░░██  ██░░██ ██░░██          ██░░██ ██░░██         ${R0}\n"; wait
  printf "${S3}██░░██  ██████  ██░░██   ██░░██   ██░░██  ██░░██  ██░░██ ██░░██  ██░░██ ██░░██  ██░░██ ██░░██  ██████  ██░░██ ██░░██████████ ${R0}\n"; wait
  printf "${S2}██░░██  ██░░██  ██░░██   ██░░██   ██░░██  ██░░██  ██░░██ ██░░██  ██░░██ ██░░██  ██░░██ ██░░██  ██░░██  ██░░██ ██░░░░░░░░░░██ ${R0}\n"; wait
  printf "${S2}██░░██  ██░░██  ██░░██   ██░░██   ██░░██  ██░░██  ██░░██ ██░░██  ██░░██ ██░░██  ██░░██ ██░░██  ██░░██  ██░░██ ██████████░░██ ${R0}\n"; wait
  printf "${S2}██░░██████░░██████░░██   ██░░██   ██░░██  ██░░██████░░██ ██░░██  ██░░██ ██░░██  ██░░██ ██░░██████░░██████░░██         ██░░██ ${R0}\n"; wait
  printf "${S6}██░░░░░░░░░░░░░░░░░░██ ████░░████ ██░░██  ██░░░░░░░░░░██ ██░░████░░░░██ ██░░██████░░██ ██░░░░░░░░░░░░░░░░░░██ ██████████░░██ ${R0}\n"; wait
  printf "${S6}██░░██████░░██████░░██ ██░░░░░░██ ██░░██  ██████████░░██ ██░░░░░░░░████ ██░░░░░░░░░░██ ██░░██████░░██████░░██ ██░░░░░░░░░░██ ${R0}\n"; wait
  printf "${S1}██████  ██████  ██████ ██████████ ██████          ██████ ████████████   ██████████████ ██████  ██████  ██████ ██████████████${R0}\n\n";wait

  printf "${S3}DOWNLOADING CLOUDFLARE....${R0}\n"
  if [[ ${archit^^} == *'X86_64'* || ${archit^^} == *'AMD64'* ]]; then
    _win64_
    mv -v cloudflared.exe /usr/bin
    printf "\n${S4}${B1}Cloudflared installer finished!${R0}\n"
  fi
  exit
fi
