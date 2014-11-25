reset

set term epslatex color size 5.2,3.5

set output './plots/zeemann_aufspaltung/b4.tex'

set title ''

set key top right

set xrange [0.85:1.15]
set yrange [0:*]
set xlabel 'Winkel $\alpha$ / \si{\degree}'
set ylabel 'Intensität $I$ / \si{\percent}'

set grid

# Amplituden
a1 = 23
a2 = 32
a3 = 18

# Mittelwerte
b1 = 0.94
b2 = 1.02
b3 = 1.08

#Schwankungsbreiten
c1 = 0.06
c2 = 0.06
c3 = 0.06

# Untergrund
d = 7.2

t(x)= a1*exp(-0.5*((x-b1)/c1)**2) + a2*exp(-0.5*((x-b2)/c2)**2) + a3*exp(-0.5*((x-b3)/c3)**2) + d
fit[x=0.85:1.15] t(x) './messwerte/b4.txt' using 1:2:(0.4) via a1, a2, a3, b1, b2, b3, c1, c2, c3, d

g1(x) = a1*exp(-0.5*((x-b1)/c1)**2) # Gaußfit 1
g2(x) = a2*exp(-0.5*((x-b2)/c2)**2) # Gaußfit 2
g3(x) = a3*exp(-0.5*((x-b3)/c3)**2) # Gaußfit 3
u(x) = d											# Untergrund

load './../gnuplot_linestyles.plt'

plot 	'./messwerte/b4.txt' using 1:2:(0.0025):(0.4) with xyerrorbars t'Messwerte' ls 1,\
		t(x) t'$\Sigma$' ls 1 lw 2,\
		g1(x) t'$\mathcal{G}_1$' ls 2 lw 2,\
		g2(x) t'$\mathcal{G}_2$' ls 3 lw 2,\
		g3(x) t'$\mathcal{G}_3$' ls 4 lw 2,\
		u(x) t'$d$' ls 5 lw 2

unset output