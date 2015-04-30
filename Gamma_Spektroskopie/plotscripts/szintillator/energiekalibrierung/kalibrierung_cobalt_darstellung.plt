reset

set term epslatex color size 5.2,3.5

set output './plots/szintillator/energiekalibrierung/cobalt_darstellung.tex'

set title ''

set key top center

set xrange [6000:6700]
set yrange [0:1200]
set xlabel 'Kanalnummer $n$'
set ylabel 'Ereignisse $N$'

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

t(x)= a1*exp(-0.5*((x-b1)/c1)**2) + a2*exp(-0.5*((x-b2)/c2)**2) + d + e*x
fit[x=6000:6750] t(x) './data/Szintillator/cobalt_bereinigt.txt' using 1:2:3 yerror via a1, a2, b1, b2, c1, c2, d, e

g1(x) = a1*exp(-0.5*((x-b1)/c1)**2) # Gaußfit 1
g2(x) = a2*exp(-0.5*((x-b2)/c2)**2) # Gaußfit 2
u(x) = d + e*x							# Untergrund

load './../gnuplot_linestyles.plt'

set bars small

plot 	'./data/szintillator/cobalt_bereinigt.txt' using 1:2:3 every 2 w errorbars t'Messwerte' ls 1 pt 7 ps .75,\
		t(x) t'$\Sigma$' ls 2 lw 2,\
		g1(x) t'$\mathcal{G}_1$' ls 3 lw 2,\
		g2(x) t'$\mathcal{G}_2$' ls 4 lw 2,\
		u(x) t'$u(n)$' ls 5 lw 2

unset output