reset

set term epslatex color size 5,3.5

set output './plots/gitterkonstante.tex'

set title ''

set key bottom right

set xrange [*:*]
set yrange [*:*]
set xlabel '$\sin(\alpha)+\sin(\beta)$''
set ylabel 'Wellenlänge $\lambda$ / \si{\nano\meter}'

set grid


f(x) = m * x

fit f(x) './messwerte/gitterkonstante_linearisierung.txt' using 2:1 via m

load './../gnuplot_linestyles.plt'

plot 	'./messwerte/gitterkonstante_linearisierung.txt' using 2:1:3 with xerrorbars ls 1 t'Messwerte',\
		f(x) ls 1 t'Regressionsgerade'

unset output