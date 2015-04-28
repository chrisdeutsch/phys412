reset

set term epslatex color size 5.2,3.5

set output './plots/halbleiter/energiekalibrierung/europium1.tex'

set title ''

set key top left

set xrange [600:900]
set yrange [0:2100]
set xlabel 'Kanalnummer $n$'
set ylabel 'Ereignisse'

set grid
set samples 7000

# Amplituden
a1 = 2000

# Mittelwerte
b1 = 750

#Schwankungsbreiten
c1 = 10

# Untergrund
d = 200

t(x)= a1*exp(-0.5*((x-b1)/c1)**2) + d
fit[x=600:900] t(x) './data/halbleiter/europium_bereinigt.txt' using 1:2:3 yerror via a1, b1, c1, d

g1(x) = a1*exp(-0.5*((x-b1)/c1)**2) # Gaußfit 1
g2(x) = a2*exp(-0.5*((x-b2)/c2)**2) # Gaußfit 2
u(x) = d							# Untergrund

load './../gnuplot_linestyles.plt'

plot 	'./data/halbleiter/europium_bereinigt.txt' using 1:2:3 every 2 w errorbars t'Messwerte' ls 1 ,\
		t(x) t'$\Sigma$' ls 2 lw 2,\
		g1(x) t'$\mathcal{G}_1$' ls 3 lw 2,\
		u(x) t'$d$' ls 5 lw 2

unset output