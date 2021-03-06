reset

set term epslatex color size 5,3.5

set output './plots/kalibration.tex'

set key top left

set decimalsign ','

set xrange [0:4000]
set yrange [0:*]
set xlabel '$B \rho$ / \si{G.cm}'
set ylabel '$U_\mu$ / \si{\skt}'

set grid

load './../gnuplot_linestyles.plt'

f(x) = a*x

fit f(x) './data/kalibration.txt' using 1:2:3 yerror via a

plot './data/kalibration.txt' using 1:2:3 w yerrorbars t'Messwerte' ls 1, f(x) ls 2 lw 2 t"Anpassung"

unset output
