reset

set term epslatex color size 5,3.5

set output './plots/barium_t4_grob.tex'

set title 'Barium Transmission 4 Grobspektrum'

set key top right

set decimalsign ','

set xrange [*:*]
set yrange [*:*]
set xlabel '$U_\mathrm{H}$ / \si{\skt}'
set ylabel '$n$'

unset grid

load './../gnuplot_linestyles.plt'


plot './data/barium_t4_grob.txt' using 1:3:2:4 w xyerrorbars t'Messwerte' ls 1

unset output
