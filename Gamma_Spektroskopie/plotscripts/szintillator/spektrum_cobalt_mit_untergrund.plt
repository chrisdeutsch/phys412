reset

set term epslatex color size 5,3.5

set output './plots/szintillator/cobalt_mit_untergrund.tex'

set key top left

set decimalsign '{,}'
#set format y "%.1f"

set xrange [0:8000]
set yrange [0:*]
set xlabel 'Kanal $n$'
set ylabel 'Ereignisse $N$'

set grid

set bars small
set style data lines

load './../gnuplot_linestyles.plt'

plot './data/szintillator/cobalt.txt' using 1:2:(sqrt($2))  w errorbars t'Messwerte' ls 1

unset output
