reset

set term epslatex color size 5,4

set output './plots/zeemann_aufspaltung/b4.tex'

set title ''

set nokey

set xrange [0.75:1.2]
set yrange [0:*]
set xlabel 'Winkel $\alpha$ / \si{\degree}'
set ylabel 'Intensität $I$ / \si{\percent}'

set grid

t(x)= a*exp(-((x-b)/(4*c)**2)) + d*exp(-((x-e)/(4*f)**2)) + g*exp(-((x-h)/(4*i)**2)) + j
fit t(x) './messwerte/b4.txt' using 1:2:(0.1) via a, b, c, d, e, f, g, h, i, j

# Amplituden
a = 23
d = 32
g = 18

# Mittelwerte
b = 0.94
e = 1.02
h = 1.08

#Schwankungsbreiten
c = 0.06
f = 0.06
i = 0.06

# Untergrund
j = 7.2

plot './messwerte/b4.txt' using 1:2:(0.005):(0.1) with xyerrorbars t'Messwerte', t(x) t'Fitfunktion'

unset output