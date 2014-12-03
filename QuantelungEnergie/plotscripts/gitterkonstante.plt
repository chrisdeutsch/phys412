reset

set term epslatex color size 5,3.5

set decimalsign ","

set output './plots/gitterkonstante.tex'

set title ''

set key bottom right

set xrange [400:700]
set yrange [*:*]
set xlabel 'Wellenlänge $\lambda$ / \si{\nano\meter}'
set ylabel '$\sin(\alpha)+\sin(\beta)$'

set grid


f(x) = m * x

fit f(x) './messwerte/gitterkonstante_linearisierung.txt' using 1:2 via m

load './../gnuplot_linestyles.plt'

plot 	'./messwerte/gitterkonstante_linearisierung.txt' using 1:2:3 with yerrorbars ls 1 t'Messwerte',\
		f(x) ls 2 t'Regressionsgerade'

unset output