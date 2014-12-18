reset

set term epslatex color size 5,3.5

set output './plots/malus.tex'

set title ''

set key top right

set xrange [0:2*pi]
set yrange [*:*]
set xlabel 'Drehwinkel $\varphi / \si{\radian}$'
set ylabel 'Intensität $I / \si{\milli\volt}$'

set grid


f(x) = a * cos( x - c )**2 + d

a = 40
#b = 0.1
c = 0.5
d = 0.6

fit[x=0:2*pi] f(x) './messwerte/intensitaet.txt' using ($1*pi/180):3:(0.3) via a, c, d

load './../gnuplot_linestyles.plt'

plot 	'./messwerte/intensitaet.txt' using ($1*pi/180):3:($2*pi/180):(0.3) with xyerrorbars ls 1 lw 2 t'Messwerte',\
    f(x) ls 1 lw 2 t'Anpassungskurve'\

unset output
