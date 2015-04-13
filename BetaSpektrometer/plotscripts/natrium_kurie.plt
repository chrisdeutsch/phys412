reset

set term epslatex color size 5,3.5

set output './plots/natrium_kurie.tex'

set key top right

set decimalsign '{,}'

set xrange [*:*]
set yrange [*:*]
set xlabel '$\epsilon$'
set ylabel '$y$'

unset grid

load './../gnuplot_linestyles.plt'

plot [1.2:2.6]'./data/natrium_kurie.txt' using 3:(sqrt($6 / ($5 * $1 * $3))) t'Messwerte' ls 1

unset output
