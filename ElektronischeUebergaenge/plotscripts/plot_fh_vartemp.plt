reset

set term epslatex color size 5,4

set output './plots/fh_vartemp.tex'

set title ''

set samples 10000

set key top left

set xrange [0:40]
set yrange [0:10]
set xlabel 'Beschleunigungsspannung $U$ / \si{\kilo\volt}'
set ylabel 'Anodenstrom $I$ / w.E.'

set grid

load './../gnuplot_linestyles.plt'

plot './messwerte/variable temperatur/155.txt' using 1:2 with lines t' $T=\SI{155}{\degreeCelsius}$' ls 1 lw 2, './messwerte/variable temperatur/160.txt' using 1:2 with lines t' $T=\SI{160}{\degreeCelsius}$' ls 2 lw 2, './messwerte/variable temperatur/165.txt' using 1:2 with lines t' $T=\SI{165}{\degreeCelsius}$' ls 3 lw 2, './messwerte/variable temperatur/170.txt' using 1:2 with lines t' $T=\SI{170}{\degreeCelsius}$' ls 4 lw 2

unset output