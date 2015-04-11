reset

set term epslatex color size 5,3.5

set output './plots/kalibration.tex'

set title 'Kalibration'

set key top right

set decimalsign ','

set xrange [0:4000]
set yrange [0:*]
set xlabel '$B \rho$ / \si{G.cm}'
set ylabel '$U_H$ / \si{\skt}'

unset grid

load './../gnuplot_linestyles.plt'

f(x) = a*x

fit f(x) './data/kalibration.txt' using 1:2:3 yerror via a

plot './data/kalibration.txt' using 1:2:3 w yerrorbars t'Messwerte' ls 1, f(x) ls 2 lw 2

unset output
