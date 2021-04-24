#!/bin/sh

DIR=$(pwd)
tmux_conf_file=${DIR}/.tmux.conf

check_success () {
    if [ $? -eq 0  ]; then
        echo OK
    else
        echo FAIL
    fi
}

old_file=~/.tmux.conf
find $old_file

result=$(check_success)

# backup old config to oldfile.backup_at_YYMMDD
if [ "$result" = "OK"  ]; then
    echo found file $old_file
    timestamp=$(date '+%Y%m%d')
    backup_file=${old_file}.backup_at_${timestamp}
    echo "backing up: $old_file => $backup_file"
    cp $old_file $backup_file

# copy new config to ~
else
    echo file not found: $old_file
    echo copying file $old_file to ~
    cp $tmux_conf_file ~
fi

echo done!

