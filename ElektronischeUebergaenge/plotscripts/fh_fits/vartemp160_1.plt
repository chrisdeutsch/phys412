reset

set term epslatex color size 5.2,3.5

set output './plots/fh_fits/vartemp160_1.tex'

set title ''

set sample 10000

set key top left

set xrange [0:40]
set yrange [0:10]
set xlabel 'Beschleunigungsspannung $U$ / \si{\kilo\volt}'
set ylabel 'Anodenstrom $I$ / w.E.'

set grid

a = 1
b = 16.7
c = 0.1
d = 0.2



t(x)= a*exp(-0.5*((x-b)/c)**2) + d
fit[x=13.:19.] t(x) './messwerte/variable temperatur/160.txt' using 1:2:(0.1) via a, b, c, d

g(x) = a*exp(-0.5*((x-b)/c)**2) # Gaußfit 1
u(x) = d											# Untergrund

load './../gnuplot_linestyles.plt'

plot 	'./messwerte/variable temperatur/160.txt' using 1:2:(0.1) t'Messwerte' ls 1,\
		t(x) t'Fit' ls 1 lw 2

unset output