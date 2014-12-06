reset

set term epslatex color size 5,3.5

set output './plots/planck_quantum_linearisierung.tex'

set title ''

set key bottom right

set xrange [500:850]
set yrange [*:*]
set xlabel '$\nu \, / \, \si{\tera\hertz}$'
set ylabel '$U_G \, / \, \si{\volt}$'

set grid


f(x) = m1 * x + n1

fit f(x) './messwerte/planck_quantum_linearisierung.txt' using 3:1:2 via m1, n1

load './../gnuplot_linestyles.plt'

plot 	'./messwerte/planck_quantum_linearisierung.txt' using 3:1:2 with yerrorbars ls 1 t'Messung 1',\
		f(x) ls 2 t'Regressionsgerade 1'

unset output