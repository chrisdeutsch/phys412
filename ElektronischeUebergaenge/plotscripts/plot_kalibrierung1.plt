reset

set term epslatex color size 5,4

set output './plots/kalibrierung1.tex'

set title ''

set nokey

set xrange [0:*]
set yrange [0:*]
set xlabel 'Spulenstrom $I$ / \si{\ampere}'
set ylabel 'Magnetfeld $B$ im Luftspalt / \si{\milli\tesla}'

set grid

f(x)= a*x**3 + b*x**2 + c*x + d
fit f(x) './messwerte/kalibrierung1.txt' using 1:2:($2*0.03) via a, b, c, d

plot './messwerte/kalibrierung1.txt' using 1:2:(0.01):($2*0.03) with xyerrorbars t'Messwerte', f(x) t'Fitfunktion'

unset output