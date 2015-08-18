#!/bin/bash

set -e

for file in $( ls ); do
    # is file a directory?
    if [[ -d $file ]]; then
        # is there an install.sh file in the directory?
        installFile="$file/install.sh"
        if [[ -f $installFile ]]; then
            echo -e "\nExecuting $installFile ..."
            bash $installFile
        fi
    fi
done
