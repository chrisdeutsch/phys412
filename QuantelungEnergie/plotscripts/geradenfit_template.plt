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


f(x) = m * x +n

fit[x=RANGE] f(x) './messwerte/MESSWERTE.txt' using 1:3:4 via m, n

load './../gnuplot_linestyles.plt'

plot 	'./messwerte/MESSWERTE.txt' using 1:3:2:4 with xyerrorbars ls 1 t'Messwerte',\
		f(x) ls 1 t'Regressionsgerade'

unset output