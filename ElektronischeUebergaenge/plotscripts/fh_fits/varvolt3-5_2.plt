reset

set term epslatex color size 5.2,3.5

set output './plots/fh_fits/varvolt3-5_2.tex'

set title ''

set sample 10000

set key top left

set xrange [0:40]
set yrange [0:10]
set xlabel 'Beschleunigungsspannung $U$ / \si{\kilo\volt}'
set ylabel 'Anodenstrom $I$ / w.E.'

set grid

a = 1.9
b = 21.5
c = 0.5
d = 0.3

t(x)= a*exp(-0.5*((x-b)/c)**2) + d
fit[x=18.:24.] t(x) './messwerte/variable gegenspannung/3-5V.txt' using 1:2:(0.1) via a, b, c, d

g(x) = a*exp(-0.5*((x-b)/c)**2) # Gaußfit 1
u(x) = d											# Untergrund

load './../gnuplot_linestyles.plt'

plot 	'./messwerte/variable gegenspannung/3-5V.txt' using 1:2:(0.1) t'Messwerte' ls 1,\
		t(x) t'Fit' ls 1 lw 2

unset output