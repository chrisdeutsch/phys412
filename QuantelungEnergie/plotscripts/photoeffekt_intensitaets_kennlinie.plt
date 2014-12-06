reset

set term epslatex color size 4.5,3

set decimalsign ","

set output './plots/kennlinie_intensitaet.tex'

set title ''

set key top right

set xrange [-0.05:2.05]
set yrange [-0.9:*]
set xlabel '$U \, / \, \si{\volt}$'
set ylabel '$I-I_0 \, / \, \si{\nano\ampere}$'

set grid


load './../gnuplot_linestyles.plt'

plot 	'./messwerte/photointensitaet_365nm_1.txt' using 1:2:3 with yerrorbars ls 1 t'Messung 1',\
		'./messwerte/photointensitaet_365nm_2.txt' using 1:2:3 with yerrorbars ls 2 t'Messung 2'

unset output