reset

set term epslatex color size 5,4

set output './plots/fh_varvolt.tex'

set title ''

set samples 10000

set key top left

set xrange [0:40]
set yrange [0:10]
set xlabel 'Beschleunigungsspannung $U$ / \si{\kilo\volt}'
set ylabel 'Anodenstrom $I$ / w.E.'

set grid

load './../gnuplot_linestyles.plt'

plot './messwerte/variable gegenspannung/2V.txt' using 1:2 with lines t'$\Delta U=\SI{2.0}{\volt}$' ls 1 lw 2, './messwerte/variable gegenspannung/2-5V.txt' using 1:2 with lines t'$\Delta U=\SI{2.5}{\volt}$'  ls 2 lw 2, './messwerte/variable gegenspannung/3V.txt' using 1:2 with lines t'$\Delta U=\SI{3.0}{\volt}$' ls 3 lw 2, './messwerte/variable gegenspannung/3-5V.txt' using 1:2 with lines t'$\Delta U=\SI{3.5}{\volt}$' ls 4 lw 2 #,'./messwerte/variable gegenspannung/5V.txt' using 1:2 with lines t'$\Delta U=\SI{5.0}{\volt}$' ls 5 lw 2

unset output