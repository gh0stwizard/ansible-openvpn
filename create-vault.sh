#!/bin/sh

#
# Usage:
#   create-vault.sh [host]
#

HOST=${1:-all}
INFILE="passwords/ssh"
VARNAME="vault_ansible_password"
OUTFILE="inventory/group_vars/${HOST}/vault.yml"
OUTDIR=`dirname ${OUTFILE}`

[ -d ${OUTDIR} ] || (mkdir -p ${OUTDIR} || exit 1)

if [ -r ${INFILE} ]; then
    # remove newlines in the tail of the password
    pw=`cat ${INFILE} | tr -d '\n'`
    echo -n "${pw}" | ansible-vault encrypt_string --output ${OUTFILE} --stdin-name ${VARNAME}
else
    echo "!!!"
    echo "!!!       ENTER PASSWORD WITHOUT NEWLINE!"
    echo "!!! DON'T PRESS ENTER KEY, JUST USE CTRL-D INSTEAD"
    echo "!!!"
    ansible-vault encrypt_string --output ${OUTFILE} --stdin-name ${VARNAME}
fi

echo "***"
echo "*** DON'T FORGET DELETE FILES: passwords/vault passwords/ssh"
echo "***"
