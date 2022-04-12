#!/bin/bash


#Show which hash is seleceted by default using arrow mark

DEFAULT="md5sum"

#Final File Name
FILE="final_file.txt"
touch "${FILE}"

#Get the input for the hash type
echo "Which hash do you want to use : "
echo "Default is ${DEFAULT}"
echo -e "1 : MD5     ---> 32 characters
2 : SHA256  ---> 64 characters
3 : SHA512  ---> 88 characters
4 : SHA1    ---> 40 characters
5 : SHA224  ---> 56 characters
6 : SHA384  ---> 96 characters"
read OPTION

#Get the info for salt
GROUP1="iron"
GROUP2="captain"

#Salt Input
echo "Enter the salt you want to use : "
echo -e "1 : GROUP1
2 : GROUP2"
read GROUP

case "${GROUP}" in
    "1") GROUP="${GROUP1}"
    ;;
    "2") GROUP="${GROUP2}"
    ;;
esac


#Get the hostname info to generate the password
echo "Enter the hostname to generate password for : "
read WORD

#New Line
echo ""

case "${OPTION}" in
    "1") echo -n "${WORD}${GROUP}" | md5sum > "${FILE}"
    ;;
    "2") echo -n "${WORD}${GROUP}" | sha256sum > "${FILE}"
    ;;
    "3") echo -n "${WORD}${GROUP}" | sha512sum > "${FILE}"
    ;;
    "4") echo -n "${WORD}${GROUP}" | sha1sum > "${FILE}"
    ;;
    "5") echo -n "${WORD}${GROUP}" | sha224sum > "${FILE}"
    ;;
    "6") echo -n "${WORD}${GROUP}" | sha384sum > "${FILE}"
    ;;
    "") echo -n "${WORD}${GROUP}" | ${DEFAULT} > "${FILE}"
    ;;
esac

CONTENTS=`cat "${FILE}"` 
echo -n "${CONTENTS}" | awk '{print $1}' > "${FILE}"
cat final_file.txt