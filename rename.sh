#!bin/bash
find  $PWD -type f -name '*\.cpp' |sed s/'\.cpp'//g|awk '{MV = "mv"};{C = "\.c"};{ CPP="\.cpp"}; {print MV, $1 CPP , $1 C}'|sh
