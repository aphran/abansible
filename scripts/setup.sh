#!/usr/bin/env bash

drepo=/srv/abansible
dconf=/etc/ansible
files=( hosts ansible.cfg )

echo -e "\nansible god-node setup!\n"

# check, explain a bit
echo " - Check for repo dir: ${drepo}"
if [ ! -d ${drepo} ]; then
    echo "    ERROR with repo dir, please make sure you have git-cloned the abansible repo to: ${drepo}"
    exit 1
fi

# setup ansible symlinks
for f in ${files[@]}; do
    echo " - Ensure symlink: ${dconf}/${f}"
    if [ ! -f ${dconf}/${f} ] && [ -f ${drepo}/${f} ]; then
        ln -s ${drepo}/${f} ${dconf}/${f}
    fi
done
