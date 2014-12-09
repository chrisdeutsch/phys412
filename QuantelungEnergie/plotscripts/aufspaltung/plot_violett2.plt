reset

set term epslatex color size 5.2,3.5

set decimalsign ","

set output './plots/aufspaltung/violett2.tex'

set title ''

set key top right

set samples 10000

set xrange [0.015:0.055]
set yrange [0:*]
set xlabel 'Winkel $\delta$ / \si{\degree}'
set ylabel 'Intensität $I$ / \si{\percent}'

set grid

# Amplituden
a1 = 0.2
#a2 = 0.1

# Mittelwerte
b1 = 0.035
#b2 = 0.042

#Schwankungsbreiten
c1 = 0.005
#c2 = 0.01

# Untergrund
d = 0.1

	#gute Werte:
	# Amplituden
	#a1 = 3
	#a2 = 0.7
	# Mittelwerte
	#b1 = 0.004
	#b2 = 0.03
	#Schwankungsbreiten
	#c1 = 0.005
	#c2 = 0.01
	# Untergrund
	#d = 0.19

t(x)= a1*exp(-0.5*((x-b1)/c1)**2) + d #a2*exp(-0.5*((x-b2)/c2)**2) + d
fit[x=-0.015:0.055] t(x) './messwerte/CCD/violett2.txt' using 1:2:(0.1) via a1, b1, c1

g1(x) = a1*exp(-0.5*((x-b1)/c1)**2) # Gaußfit 1
g2(x) = a2*exp(-0.5*((x-b2)/c2)**2) # Gaußfit 2
u(x) = d											# Untergrund

load './../gnuplot_linestyles.plt'

plot 	'./messwerte/CCD/violett2.txt' using 1:2:(0.0015):(0.1) with xyerrorbars t'Messwerte' ls 1,\
		t(x) t'$\mathcal{G}$' ls 2 lw 2,\
		u(x) t'$d$' ls 5 lw 2

unset output