reset

set term epslatex color size 5.2,3.5

set decimalsign ","

set output './plots/doppler_blau1.tex'

set title ''

set key top right

set samples 10000

set xrange [-0.03:0.06]
set yrange [0:*]
set xlabel 'Winkel $\delta$ / \si{\degree}'
set ylabel 'Intensität $I$ / \si{\percent}'

set grid

# Amplituden
a1 = 3


# Mittelwerte
b1 = 0.004


#Schwankungsbreiten
c1 = 0.005


# Untergrund
d = 0.19

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

t(x)= a1*exp(-0.5*((x-b1)/c1)**2) + d
fit[x=-0.03:0.06] t(x) './messwerte/CCD/blau1.txt' using 1:2:(0.1) via a1, b1, c1, d

g1(x) = a1*exp(-0.5*((x-b1)/c1)**2) # Gaußfit 1
u(x) = d											# Untergrund

load './../gnuplot_linestyles.plt'

plot 	'./messwerte/CCD/blau1.txt' using 1:2:(0.0015):(0.1) with xyerrorbars t'Messwerte' ls 1,\
		t(x) t'$\Sigma$' ls 1 lw 2,\
		g1(x) t'$\mathcal{G}_1$' ls 2 lw 2,\
		u(x) t'$d$' ls 5 lw 2

unset output