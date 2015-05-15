reset

set term epslatex color size 5,3.5

set output './plots/abstandsquadrat.tex'

set key top right

set decimalsign '{,}'
set format x "%.1f"

set xrange [10:40]
set yrange [0:*]
set xlabel 'Abstand $d$ / \si{cm}'
set ylabel 'Dosis $D$ / \si{mSv}'

set grid

load './../gnuplot_linestyles.plt'

f(x) = a * x**-2 + b

fit [16:40] f(x) './data/abstandsquadrat.txt' using 1:3:2:4 xyerror via a, b

plot './data/abstandsquadrat.txt' using 1:3:2:4 w xyerrorbars t'Messwerte' ls 1,\
     f(x) t'Anpassung' ls 2

unset output
