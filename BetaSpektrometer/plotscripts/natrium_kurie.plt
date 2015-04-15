reset

set term epslatex color size 5,3.5

set output './plots/natrium_kurie.tex'

set key top right

set decimalsign '{,}'

set xrange [1:2.1]
set yrange [-0.25:*]
set xlabel '$\epsilon$'
set ylabel '$y$'

set grid

load './../gnuplot_linestyles.plt'

f(x) = m*(x-b)
m = -1
b = 2.1

fit [1.5:2] f(x) './data/natrium_kurie.txt' using 1:3:2:4 xyerror via m, b

plot './data/natrium_kurie.txt' using 1:3:2:4 w xyerrorbars t'Messwerte' ls 1, f(x) ls 2

unset output
