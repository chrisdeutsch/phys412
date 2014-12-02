reset

set term epslatex color size 5,3.5

set output './plots/template.tex'

set title ''

set key bottom right

set xrange [*:*]
set yrange [*:*]
set xlabel 'XLABEL'
set ylabel 'YLABEL'

set grid


f(x) = m1 * x + n1
g(x) = m2 * x + n2

fit[x=RANGE] f(x) './messwerte/MESSWERTE1.txt' using 1:3:4 via m1, n1
fit[x=RANGE] g(x) './messwerte/MESSWERTE2.txt' using 1:3:4 via m2, n2

load './../gnuplot_linestyles.plt'

plot 	'./messwerte/MESSWERTE1.txt' using 1:3:2:4 with xyerrorbars ls 1 t'Messwerte',\
		f(x) ls 1 t'Regressionsgerade',\
		'./messwerte/MESSWERTE2.txt' using 1:3:2:4 with xyerrorbars ls 2 t'Messwerte',\
		f(x) ls 2 t'Regressionsgerade',\

unset output