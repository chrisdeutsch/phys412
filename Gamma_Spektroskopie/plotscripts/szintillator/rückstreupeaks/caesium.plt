reset

set term epslatex color size 5.2,3.5

set output './plots/szintillator/rueckstreupeaks/caesium.tex'

set title ''

set key top right

set xrange [800:1500]
set yrange [0:*]
set xlabel 'Kanalnummer $n$'
set ylabel 'Ereignisse $N$'

set grid
set samples 7000

# Amplituden
a1 = 200

# Mittelwerte
b1 = 1100

#Schwankungsbreiten
c1 = 8

# Untergrund
d = 300

t(x)= a1*exp(-0.5*((x-b1)/c1)**2) + d + e * x
fit t(x) './data/Szintillator/caesium_bereinigt.txt' using 1:2:3 yerror via a1, b1, c1, d, e

g1(x) = a1*exp(-0.5*((x-b1)/c1)**2) # Gaußfit 1
u(x) = d + e * x							# Untergrund

load './../gnuplot_linestyles.plt'

set bars small

plot 	'./data/szintillator/caesium_bereinigt.txt' using 1:2:3 every 2 w errorbars t'Messwerte' ls 1 pt 7 ps .75,\
		t(x) t'$\Sigma$' ls 2 lw 2,\
		g1(x) t'$\mathcal{G}$' ls 3 lw 2,\
		u(x) t'$u$' ls 5 lw 2

unset output