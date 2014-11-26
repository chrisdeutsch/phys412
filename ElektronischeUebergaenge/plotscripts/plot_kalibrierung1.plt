reset

set term epslatex color size 5,4

set output './plots/kalibrierung1.tex'

set title ''

set key bottom right

set xrange [0:*]
set yrange [0:*]
set xlabel 'Spulenstrom $I$ / \si{\ampere}'
set ylabel 'Magnetfeld $B$ im Luftspalt / \si{\milli\tesla}'

set grid

f(x)= a*x**3 + b*x**2 + c*x
fit f(x) './messwerte/kalibrierung1.txt' using 1:2:(5) via a, b, c

load './../gnuplot_linestyles.plt'

plot './messwerte/kalibrierung1.txt' using 1:2:(0.01):(5) with xyerrorbars t'Messwerte', f(x) t'Polynom 3. Grades' ls 2 lw 2

unset output