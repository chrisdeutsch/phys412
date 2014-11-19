reset

set term epslatex color size 5,4

set output './plots/kalibrierung2.tex'

set title ''

set nokey

set xrange [0:*]
set yrange [0:*]
set xlabel 'Spulenstrom $I$ / \si{\ampere}'
set ylabel 'Magnetfeld $B$ im Luftspalt / \si{\milli\tesla}'

set grid

f(x)= a*x**3 + b*x**2 + c*x + d
fit f(x) './messwerte/kalibrierung2.txt' using 1:2:(10) via a, b, c, d

plot './messwerte/kalibrierung2.txt' using 1:2:(0.01):(10) with xyerrorbars t'Messwerte', f(x) t'Fitfunktion'

unset output