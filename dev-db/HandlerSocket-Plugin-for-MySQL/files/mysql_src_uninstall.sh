#/bin/sh

ebuild ${1}.ebuild clean
if [ $? -ne 0 ];then
    exit 1
fi
exit 0