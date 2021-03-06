reset

set term epslatex color size 5.2,3.5

set decimalsign ","

set output './plots/aufspaltung/tuerkis2.tex'

set title ''

set key top right

set samples 10000

set xrange [0.055:0.118]
set yrange [0:*]
set xlabel 'Winkel $\alpha$ / \si{\degree}'
set ylabel 'Intensität $I$ / \si{\percent}'

set grid

# Amplituden
a1 = 10
a2 = 2

# Mittelwerte
b1 = 0.08
b2 = 0.099

#Schwankungsbreiten
c1 = 0.01
c2 = 0.01

# Untergrund
d = 0.9

t(x)= a1*exp(-0.5*((x-b1)/c1)**2) + a2*exp(-0.5*((x-b2)/c2)**2)  + d
fit[x=0.055:0.115] t(x) './messwerte/CCD/tuerkis2.txt' using 1:2:(0.3) via a1, a2, b1, b2, c1, c2, d

g1(x) = a1*exp(-0.5*((x-b1)/c1)**2) # Gaußfit 1
g2(x) = a2*exp(-0.5*((x-b2)/c2)**2) # Gaußfit 2
u(x) = d											# Untergrund

load './../gnuplot_linestyles.plt'

plot 	'./messwerte/CCD/tuerkis2.txt' using 1:2:(0.3) with yerrorbars t'Messwerte' ls 1,\
		t(x) t'$\Sigma$' ls 1 lw 2,\
		g1(x) t'$\mathcal{G}_1$' ls 2 lw 2,\
		g2(x) t'$\mathcal{G}_2$' ls 3 lw 2,\
		u(x) t'$d$' ls 5 lw 2

unset output