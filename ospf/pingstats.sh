#!/bin/bash

for file in stats/*/host-router-ping
do
	name="${file#*/}"
	name="${name%/*}"
cat <<-EOF
	\subsection{$name}
		\begin{lstlisting}
			$(cat "$file")
		\end{lstlisting}

EOF
done
