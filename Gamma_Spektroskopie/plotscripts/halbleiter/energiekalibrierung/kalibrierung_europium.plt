reset

set term epslatex color size 5.2,3.5

set output './plots/halbleiter/energiekalibrierung/europium.tex'

set title ''

set key top left

set xrange [500:7000]
set yrange [0:2100]
set xlabel 'Kanalnummer $n$'
set ylabel 'Ereignisse'

set grid
set samples 8000

# Amplituden
a1 = 2000
a2 = 400
a3 = 400
a4 = 100
a5 = 100
a6 = 100

# Mittelwerte
b1 = 800
b2 = 1300
b3 = 2000
b4 = 4500
b5 = 6000
b6 = 6600

#Schwankungsbreiten
c1 = 10
c2 = 10
c3 = 30
c4 = 50
c5 = 50
c6 = 50

# Untergrund
d = 80

t(x)= a1*exp(-0.5*((x-b1)/c1)**2) + a2*exp(-0.5*((x-b2)/c2)**2) + a3*exp(-0.5*((x-b3)/c3)**2) + a4*exp(-0.5*((x-b4)/c4)**2) + a5*exp(-0.5*((x-b5)/c5)**2) + a6*exp(-0.5*((x-b6)/c6)**2) + d
fit[x=500:6838] t(x) './data/halbleiter/europium_bereinigt.txt' using 1:2:3 yerror via a1, a2, a3, a4, a5, a6, b1, b2, b3, b4, b5, b6, c1, c2, c3, c4, c5, c6, d

g1(x) = a1*exp(-0.5*((x-b1)/c1)**2) # Gaußfit 1
g2(x) = a2*exp(-0.5*((x-b2)/c2)**2) # Gaußfit 2
g3(x) = a3*exp(-0.5*((x-b3)/c3)**2) # Gaußfit 2
g4(x) = a4*exp(-0.5*((x-b4)/c4)**2) # Gaußfit 2
g5(x) = a5*exp(-0.5*((x-b5)/c5)**2) # Gaußfit 2
g6(x) = a6*exp(-0.5*((x-b6)/c6)**2) # Gaußfit 2

u(x) = d							# Untergrund

load './../gnuplot_linestyles.plt'

plot 	'./data/halbleiter/europium_bereinigt.txt' using 1:2:3 every 2 w errorbars t'Messwerte' ls 1 ,\
		t(x) t'$\Sigma$' ls 2 lw 2,\
		g1(x) t'$\mathcal{G}_1$' ls 3 lw 2,\
		g2(x) t'$\mathcal{G}_2$' ls 4 lw 2,\
		g3(x) t'$\mathcal{G}_2$' ls 4 lw 2,\
		g4(x) t'$\mathcal{G}_2$' ls 4 lw 2,\
		g5(x) t'$\mathcal{G}_2$' ls 4 lw 2,\
		g6(x) t'$\mathcal{G}_2$' ls 4 lw 2,\

		u(x) t'$d$' ls 5 lw 2

unset output