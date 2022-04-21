#!/bin/sh
currentver="2022.1"
rep="latest"
for i in `cat 2022OVURLs_nospace.txt`
do 
    ver="${i}"
    ver=${i/latest/$currentver}
    wget --output-document=latest.html $i
    wget --output-document=20221.html $ver

    diff --brief latest.html 20221.html >/dev/null
    comp_value=$?

    if [ $comp_value -eq 1 ]
    then
        echo "${i} no"
    else
        echo "${i} yes"
    fi
done
