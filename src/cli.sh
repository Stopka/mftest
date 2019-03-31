#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
cd $DIR;
if [[ $# -eq 0 ]] ; then
    php7.2 "bin/console.php"
else
    php7.2 "bin/console.php" "$@"
fi
