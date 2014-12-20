reset

set term epslatex color size 5,3.5

set output './plots/malus.tex'

set title ''

set key top right

set xrange [0:360]
set yrange [*:*]
set xlabel 'Drehwinkel $\varphi / \si{\degree}$'
set ylabel 'Intensität $I / \si{\milli\volt}$'

set xtics (0, 90, 180, 270, 360)
set mxtics 2

set grid

f(x) = a* cos( (x-b) * pi/180 )**2 + c

a = 40
b = 2
c = 0.6

fit[x=0:360] f(x) './messwerte/intensitaet.txt' using 1:3:(0.3) via a, b, c

load './../gnuplot_linestyles.plt'

plot 	'./messwerte/intensitaet.txt' using 1:3:2:(0.3) with xyerrorbars ls 2 lw 2 t'Messwerte',\
    f(x) ls 1 lw 2 t'Anpassungskurve'\

unset output
