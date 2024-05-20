#!/bin/bash

## inventory local user using lslogins
inv_local_user(){
cat /etc/passwd |grep /bin/bash |cut -d: -f1 | while read ident ;do
    echo -n "$ident,$(hostname -s),$(hostname -s),Linux Server,"
    if [[ $(sudo -l -U $ident |grep 'ALL'|wc -l) -gt 0 ]]
    then
        echo -n "Admin"
    else
        echo -n "Normal User"
    fi
    echo ",Active,$(date +"%Y/%m/%d")"
done
}

inv_local_user