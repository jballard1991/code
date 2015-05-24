while true; do for i in `dog --links http://boards.4chan.org/b/ | grep -E 'jpg|png|.webm'|sed 's/b\/\//b\//g' |sed 's/\/boards\.4chan\.org\/b//g'`; do sleep 1;wget -nc -c "$i"; done ; done
