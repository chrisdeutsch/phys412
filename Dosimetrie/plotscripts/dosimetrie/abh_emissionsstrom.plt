reset

set term epslatex color size 5,3.5

set key top left

set decimalsign '{,}'

set xrange [0:1.0]
set yrange [0:*]
set xlabel 'Emissionsstrom $I_\mathrm{E} / \si{mA}$'
set ylabel 'Ionisationsstrom $I_\mathrm{C} / \si{nA}$'

set grid

load './../gnuplot_linestyles.plt'

#set bars small

set output './plots/abh_emissionsstrom/mo.tex'

f(x) = m1 * x + b1

fit f(x) './data/abh_emissionsstrom/mo.txt' using 1:5:2:6 xyerror via m1, b1

plot './data/abh_emissionsstrom/mo.txt' using 1:5:2:6 w xyerrorbars t'Messdaten' ls 1,\
     f(x) t'Anpassung' ls 2


set output './plots/abh_emissionsstrom/cu.tex'

g(x) = m2 * x + b2

fit [0.0:0.4] g(x) './data/abh_emissionsstrom/cu.txt' using 1:5:2:6 xyerror via m2, b2

plot './data/abh_emissionsstrom/cu.txt' using 1:5:2:6 w xyerrorbars t'Messdaten' ls 1,\
     g(x) t'Anpassung' ls 2

unset output