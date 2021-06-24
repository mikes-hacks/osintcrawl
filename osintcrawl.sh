#!/bin/bash

if [[ $# -eq 0 ]] ; then
    echo ''
    echo 'Usage: osintcrawl.sh megacorpone'
    echo ''
    exit 1
fi

if [ "$1" == "-h" ]; then
    echo ''
    echo 'Usage: osintcrawl.sh megacorpone'
    echo ''
    exit 1
fi

d=`echo $1 | cut -f1 -d'.'`

chk=(
    https://google.com/search?q=$d
    https://twitter.com/search?q=$d
    https://www.google.com/search?q=site%3Atwitter.com+$d
    https://stackoverflow.com/search?q=$d
    https://www.google.com/search?q=site%3Apastebin.com+$d
    https://www.linkedin.com/search/results/all/?keywords=%22$d%22
    https://www.google.com/search?q=site%3Alinkedin.com+$d
    https://github.com/search?q=$d
    https://about.gitlab.com/#stq=$d
    https://www.yelp.com/search?find_desc=$d
    https://foursquare.com/explore?mode=url&q=$d
    https://www.google.com/search?q=site%3Ainstagram.com+$d
    https://www.google.com/search?q=site%3Afacebook.com+$d
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
