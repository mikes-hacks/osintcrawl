#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo ''
    echo 'Usage: osintcrawl.sh megacorpone.com'
    echo ''
    exit 1
fi

if [ "$1" == "-h" ]; then
    echo ''
    echo 'Usage: osintcrawl.sh megacorpone.com'
    echo ''
    exit 1
fi

d=`echo $1 | cut -f1 -d'.'`

chk=(
    https://google.com/search?q=$d
    https://twitter.com/search?q=$d
    https://stackoverflow.com/search?q=$d
)

echo "<HTML><BODY><BR>" > $d.html
echo "<h1>OSINT crawl</h1>" >> $d.html

for c in "${chk[@]}"; do
    #cutycapt --url=$c --out=$d_$c.png;
    echo "$c" >> $d.html
    echo "<BR><A HREF=\""$c"\"><IMG SRC=\""$d_$c"\" width=600></A><BR><BR>" >> $d.html
done

echo "</BODY></HTML>" >> $d.html

firefox $d.html
