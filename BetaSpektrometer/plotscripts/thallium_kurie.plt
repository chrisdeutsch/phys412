reset

set term epslatex color size 5,3.5

set output './plots/thallium_kurie.tex'

set key top right

set decimalsign '{,}'

set xrange [1:*]
set yrange [-0.05:*]
set xlabel '$\epsilon$'
set ylabel '$y$'

set grid

load './../gnuplot_linestyles.plt'

f(x) = m*(x-b)
m = -0.5
b = 2.2

fit [1.4:2.4] f(x) './data/thallium_kurie.txt' using 1:3:2:4 xyerror via m, b

plot './data/thallium_kurie.txt' using 1:3:2:4 w xyerrorbars t'Messwerte' ls 1, f(x) ls 2

unset output
