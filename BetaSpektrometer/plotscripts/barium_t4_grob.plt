reset

set term epslatex color size 5,3.5

set output './plots/barium_t4_grob.tex'

set key top right

set decimalsign '{,}'
set format y "%.1f"

set xrange [*:*]
set yrange [*:*]
set xlabel '$ U_\mathrm{H}^\mathrm{korr.}$ / \si{\skt}'
set ylabel '$n$'

set grid

load './../gnuplot_linestyles.plt'

plot './data/barium_t4_grob.txt' using 1:3:2:4 w xyerrorbars t'Messwerte' ls 1

unset output
