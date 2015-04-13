reset

set term epslatex color size 5,3.5

set output './plots/thallium_spektrum.tex'

set key top right

set decimalsign '{,}'

set xrange [*:*]
set yrange [*:*]
set xlabel '$B \rho$ / \si{G.cm}'
set ylabel '$n$'

set grid

load './../gnuplot_linestyles.plt'

plot './data/thallium_t4_grob.txt' using 1:3:2:4 w xyerrorbars t'Messwerte' ls 1

unset output
