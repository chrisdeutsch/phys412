reset

set term epslatex color size 5.2,3.5

set output './plots/peakauswahl.tex'

set title ''

set key top right

set xrange [-4:5]
set yrange [0:*]
set xlabel 'Winkel $\alpha$ / \si{\degree}'
set ylabel 'Intensität $I$ / \si{\percent}'

set grid

load './../gnuplot_linestyles.plt'

set arrow from 0.8,1 to 1.2,1 lw 1 nohead
set arrow from 1.2,1 to 1.2,45 lw 1 nohead
set arrow from 1.2,45 to 0.8,45 lw 1 nohead
set arrow from 0.8,45 to 0.8,1 lw 1 nohead

plot 	'./messwerte/b0.txt' using 1:2 with lines t'Messwerte' ls 1,\

unset output