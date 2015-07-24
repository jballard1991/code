#!/bin/bash
rm -i code.file.html; for i in `ls ${BASH_ARGV[*]}`; do echo "//"$i|pygmentize|aha>>code.file.html;bcpp $i|nl|pygmentize|aha>>code.file.html; done
