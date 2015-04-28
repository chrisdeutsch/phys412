reset

set term epslatex color size 5.2,3.5

set output './plots/szintillator/energiekalibrierung/cobalt.tex'

set title ''

set key top left

set xrange [5800:6800]
set yrange [0:1100]
set xlabel 'Kanalnummer $n$'
set ylabel 'Ereignisse'

set grid
set samples 7000

# Amplituden
a1 = 1000
a2 = 900
a3 = 18

# Mittelwerte
b1 = 6250
b2 = 6500
b3 = 1.08

#Schwankungsbreiten
c1 = 10
c2 = 10
c3 = 0.06

# Untergrund
d = 100

t(x)= a1*exp(-0.5*((x-b1)/c1)**2) + a2*exp(-0.5*((x-b2)/c2)**2) + d
fit[x=600:6800] t(x) './data/Szintillator/cobalt_bereinigt.txt' using 1:2:3 yerror via a1, a2, b1, b2, c1, c2, d

g1(x) = a1*exp(-0.5*((x-b1)/c1)**2) # Gaußfit 1
g2(x) = a2*exp(-0.5*((x-b2)/c2)**2) # Gaußfit 2
u(x) = d							# Untergrund

load './../gnuplot_linestyles.plt'

plot 	'./data/szintillator/cobalt_bereinigt.txt' using 1:2:3 every 2 w errorbars t'Messwerte' ls 1 ,\
		t(x) t'$\Sigma$' ls 2 lw 2,\
		g1(x) t'$\mathcal{G}_1$' ls 3 lw 2,\
		g2(x) t'$\mathcal{G}_2$' ls 4 lw 2,\
		u(x) t'$d$' ls 5 lw 2

unset output