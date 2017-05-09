#!/bin/bash

find $1 -name "*.txt" | sort -V | while read file
do
	ASNUM=${file#$1/}
	ASNUM=${ASNUM%.txt}
#	(
#	echo "digraph {"
#	cat base2.dot
#	tail -n+2 "$file" | ./parse2 " -> "
#	echo "}"
#	) | neato -Tpdf > "${file%.txt}.pdf"
#	) | neato -Tpng > "${file%.txt}.png"
#	) > "${file%.txt}.dot"
	cat <<-EOF
	\subsubsection{AS $ASNUM}
		\lstinputlisting{../Part_Dominik/bgp/$file}
EOF
done
