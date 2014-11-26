reset

set term epslatex color size 5.2,3.5

set output './plots/b0.tex'

set title ''

set key top right

set xrange [0.88:1.14]
set yrange [0:*]
set xlabel 'Winkel $\alpha$ / \si{\degree}'
set ylabel 'Intensität $I$ / \si{\percent}'

set grid

# Amplituden
a1 = 30

# Mittelwerte
b1 = 0.94

#Schwankungsbreiten
c1 = 0.06

# Untergrund
d = 4

t(x)= a1*exp(-0.5*((x-b1)/c1)**2) + d
fit[x=0.88:1.14] t(x) './messwerte/b0.txt' using 1:2:(0.4) via a1, b1, c1, d

g1(x) = a1*exp(-0.5*((x-b1)/c1)**2) # Gaußfit 1
u(x) = d											# Untergrund

load './../gnuplot_linestyles.plt'

plot 	'./messwerte/b0.txt' using 1:2:(0.0025):(0.4) with xyerrorbars t'Messwerte' ls 1,\
		t(x) t'$\Sigma$' ls 1 lw 2,\
		g1(x) t'$\mathcal{G}$' ls 2 lw 2,\
		u(x) t'$d$' ls 5 lw 2

unset output