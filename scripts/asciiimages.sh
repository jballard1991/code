while true; do for i in `ls *.jpg `; do jp2a $i;rm -v $i;sleep 1; done; for i in `ls *.png`; do echo "converting $i";convert $i `echo $i| sed 's/\.png/\.jpg/g'`;rm -v $i; done; done
