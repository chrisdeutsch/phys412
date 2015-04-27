reset

set term epslatex color size 5,3.5

set output './plots/halbleiter/cobalt.tex'

set key top left

set decimalsign '{,}'
#set format y "%.1f"

set xrange [0:*]
set yrange [0:*]
set xlabel 'Kanal $n$'
set ylabel 'Ereignisse $$'

set grid

load './../gnuplot_linestyles.plt'

plot './data/halbleiter/cobalt_bereinigt.txt' using 1:2 w boxes t'Messwerte' ls 1

unset output
