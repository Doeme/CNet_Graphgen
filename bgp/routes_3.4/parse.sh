#!/bin/bash

for id in {1..10} {12..18} {21..28} {31..38}
do
	(
	echo "digraph{"
	cat "../base2.dot"
	grep " $id i\$" info.txt | while read route
	do
		oldas=11;
		color="gray";
		if [ "${route:0:2}" == "*>" ]
		then
			color="black"
		fi;
		echo "$route" | perl -pe 's|.*? 0 ((?:[0-9]+ )+)i|\1|' | sed 's/ $//;s/ /\n/g' | uniq | while read as
		do
			echo "$oldas -> $as[color=$color];"
			oldas=$as;
		done
	done
	echo "}"
	) > "$id.dot"
	neato -Tpdf "$id.dot" > "$id.pdf"
cat <<-EOF
	\clearpage
	\subsubsection{AS $id}
		\includegraphics[width=\linewidth]{../Part_Dominik/bgp/routes_3.4/$id.pdf}
EOF
done
