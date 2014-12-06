reset

set term epslatex color size 4.5,3

set output './plots/rydberg_linearisierung.tex'

set title ''

set key bottom right

set xrange [0.13:0.23]
set yrange [*:*]
set xlabel '$\frac{1}{4} - \frac{1}{n^2}$'
set ylabel '$\frac{1}{\lambda}$ / $\si{\per\micro\metre}$'

set grid


f(x) = m1 * x

fit f(x) './messwerte/rydberg_linearisierung.txt' using (0.25 - 1.0/($1)**2):2:3 via m1

load './../gnuplot_linestyles.plt'

plot 	'./messwerte/rydberg_linearisierung.txt' using (0.25 - 1.0/($1)**2):2:3 with yerrorbars ls 1 t'Messwerte',\
		f(x) ls 2 t'Regressionsgerade'

unset output