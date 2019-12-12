#!/bin/bash
banner(){
clear
echo "########################################################"
echo "########################################################"
echo "#######| Xmap toolkit v 1.0 | Faster than nmap |########"
echo "########################################################"
echo "########################################################"
echo "###############| Scripted By Ali Baghban |##############"
echo "########################################################"
echo "########################################################"
echo "#########################{ 2019 }#######################"
echo "########################################################"
echo "--------------------------------------------------------"
var=$(ifconfig | awk '{ if($1 == "inet") print $2 }' | awk 'NR==2,NR==2 {print $0}')
echo "Your Local IP > " $var
echo "--------------------------------------------------------"
}
loading(){
  clear
  hr
  echo ""
  echo "Loading script ... "
  echo ""
  printf "[ "
  for (( i = 0; i < 10; i++ )); do
    var=`expr $i \* 10`
    printf "===="
    sleep 1
  done
  printf " ]"
  start
}
banner_exit(){
clear
echo "########################################################"
echo "#############| Thanks for using our script |############"
echo "########################################################"
echo "###############| Scripted By Ali Baghban |##############"
echo "#########################{ 2019 }#######################"
echo "########################################################"
}
hr(){
echo "--------------------------------------------------------"
}
go_back(){
  read -p "Press Enter to continue ..." x
  scan
}
start(){
  read -p "Press Enter to continue ..." x
  clear
  banner
}
scan(){
  hr
  echo "Scanning Options :"
  echo "1 -> Regular scan"
  echo "2 -> Quick scan"
  echo "3 -> Intense scan -A"
  echo "4 -> Intense scan plus UDP"
  echo "5 -> Intense scan, all TCP ports"
  echo "6 -> Intense scan, No Ping"
  echo "7 -> Ping Scan"
  echo "8 -> Quick+ Scan"
  echo "9 -> Quick traceroute"
  echo "10 -> Go back"
  hr
  read -p "Select option => " input
  hr
  if [ $input == '10' ]; then
  clear && banner && options
  fi
  read -p "Target ip => " ip
  case $input in
  '1' ) clear && echo "Start Scaninng ..." && hr && nmap $ip && hr && go_back;;
  '2' ) clear && echo "Start Scaninng ..." && hr && nmap -T4 -F $ip && hr && go_back;;
  '3' ) clear && echo "Start Scaninng ..." && hr && nmap -T4 -A -v $ip && hr && go_back;;
  '4' ) clear && echo "Start Scaninng ..." && hr && nmap -sS -sU -T4 -A -v $ip && hr && go_back;;
  '5' ) clear && echo "Start Scaninng ..." && hr && nmap -p 1-65535 -T4 -A -v $ip && hr && go_back;;
  '6' ) clear && echo "Start Scaninng ..." && hr && nmap -T4 -A -v -Pn $ip && hr && go_back;;
  '7' ) clear && echo "Start Scaninng ..." && hr && nnmap -sn $ip && hr && go_back;;
  '8' ) clear && echo "Start Scaninng ..." && hr && nmap -sV -T4 -O -F --version-light $ip && hr && go_back;;
  '9' ) clear && echo "Start Scaninng ..." && hr && nmap -sn --traceroute $ip && hr && go_back;;
  esac

}
options(){
echo "Option :"
echo "1 -> Install requirements"
echo "2 -> Scan"
echo "3 -> Clear Terminal"
echo "4 -> Exit"
hr
read -p "Select option => " input
case $input in
'1' ) clear && echo "OK ... start installing" && apt-get upgrade -y && apt-get install nmap && clear && echo "Installation has been done" && hr && options;;
'2' ) clear && scan && options;;
'3' ) clear && options;;
'4' ) banner_exit && exit;;
esac
}
loading
options
