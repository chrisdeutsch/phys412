reset

set term epslatex color size 5,3.5

set output './plots/gitterkonstante.tex'

set title ''

set key bottom right

set xrange [*:*]
set yrange [*:*]
set xlabel 'Wellenlänge $\lambda$ / \si{\nano\meter}'
set ylabel '$\sin(\alpha)+\sin(\beta)$'

set grid


f(x) = m * x

fit f(x) './messwerte/gitterkonstante_linearisierung.txt' using 1:2:3 via m

load './../gnuplot_linestyles.plt'

plot 	'./messwerte/gitterkonstante_linearisierung.txt' using 1:2:3 with yerrorbars ls 1 t'Messwerte',\
		f(x) ls 1 t'Regressionsgerade'

unset output