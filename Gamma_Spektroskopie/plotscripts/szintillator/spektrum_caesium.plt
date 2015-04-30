reset

set term epslatex color size 5,3.5

set output './plots/szintillator/caesium.tex'

set key top right

set decimalsign '{,}'
#set format y "%.1f"

set xrange [0:5000]
set yrange [0:*]
set xlabel 'Kanal $n$'
set ylabel 'Ereignisse $N$'

set grid

load './../gnuplot_linestyles.plt'

set bars small
set style data lines

plot './data/szintillator/caesium_bereinigt.txt' using 1:2:3 w errorbars t'Messwerte' ls 1

unset output
