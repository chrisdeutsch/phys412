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

t(x)= a1*exp(-0.5*((x-b1)/c1)**2) + a2*exp(-0.5*((x-b2)/(sqrt(2)*c2))**2) + a3*exp(-0.5*((x-b3)/c3)**2) + d
fit[x=0.75:1.2] t(x) './messwerte/b4.txt' using 1:2:(0.1) via a1, a2, a3, b1, b2, b3, c1, c2, c3, d

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

plot './messwerte/b4.txt' using 1:2:(0.005):(0.1) with xyerrorbars t'Messwerte', t(x) t'Fitfunktion'

unset output