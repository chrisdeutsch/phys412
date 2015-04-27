reset

set term epslatex color size 5,3.5

set output './plots/szintillator/cobalt.tex'

set key top left

set decimalsign '{,}'
#set format y "%.1f"

set xrange [*:*]
set yrange [*:*]
set xlabel 'Kanal $n$'
set ylabel 'Ereignisse $$'

set grid

load './../gnuplot_linestyles.plt'

plot './data/szintillator/cobalt_bereinigt.txt' using 1:2 w boxes t'Messwerte' ls 1

unset output
