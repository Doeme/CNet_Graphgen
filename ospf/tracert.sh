#!/bin/bash

DIR="${1%/}"

for file in $DIR/*
do
	name="${file#$DIR/}"
	for file2 in "$file"/tracert-*
	do
		[ ! -f "$file2" ] && break;
		name2="${file2##*-}"
		outfile="${file}/$name_$name2.dot"
		outfile2="${file}/$name_$name2.pdf"
		(
		echo "graph G{"
		cat base.dot
		./parse "--" < "$file2"
		echo "}"
		) > "$outfile"
		neato -Tpdf "$outfile" > "$outfile2"
		cat <<-EOF
		\clearpage
		\subsubsection{$name - $name2}
		\begin{lstlisting}
$(cat "$file2")
		\end{lstlisting}
		\begin{figure}[H]
			\centering
			\includegraphics[width=0.75\linewidth]{../Part_Dominik/$outfile2}
			\caption{The traceroute from $name to $name2}
		\end{figure}
EOF
	done
done
