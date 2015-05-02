reset

set term epslatex color size 5.2,3.5

set output './plots/halbleiter/rueckstreupeaks/cobalt.tex'

set title ''

set key top left

set xrange [900:1350]
set yrange [0:*]
set xlabel 'Kanalnummer $n$'
set ylabel 'Ereignisse'

set grid
set samples 7000

# Amplituden
a1 = 200

# Mittelwerte
b1 = 1100

#Schwankungsbreiten
c1 = 80

# Untergrund
d = 200

t(x)= a1*exp(-0.5*((x-b1)/c1)**2) + d 
fit t(x) './data/halbleiter/cobalt_bereinigt.txt' using 1:2:3 yerror via a1, b1, c1, d

g1(x) = a1*exp(-0.5*((x-b1)/c1)**2) # Gaußfit 1
u(x) = d 							# Untergrund

load './../gnuplot_linestyles.plt'

plot 	'./data/halbleiter/cobalt_bereinigt.txt' using 1:2:3 every 2 w errorbars t'Messwerte' ls 1 ,\
		t(x) t'$\Sigma$' ls 2 lw 2,\
		g1(x) t'$\mathcal{G}_1$' ls 3 lw 2,\
		u(x) t'$d$' ls 5 lw 2

unset output
