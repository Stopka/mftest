#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )";
cd $DIR;
if [[ $# -eq 0 ]] ; then
    php7.2 "vendor/nette/tester/src/tester.php"
else
    php7.2 "vendor/nette/tester/src/tester.php" "$@"
fi
