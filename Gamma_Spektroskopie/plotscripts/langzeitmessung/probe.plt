reset

set term epslatex color size 5,3.5

set output './plots/langzeitmessung/spektrum.tex'

set key top left

set decimalsign '{,}'
#set format y "%.1f"

set xrange [0:*]
set yrange [0:*]
set xlabel 'Kanal $n$'
set ylabel 'Ereignisse $N$'

set grid

set bars small
set style data lines

set grid xtics x2tics ytics

set xtics nomirror

set link x via 0.200839*x inverse 0.200839*x

set x2label 'Energie / \si{\kilo\electronvolt}'
set x2tics nomirror


load './../gnuplot_linestyles.plt'

plot './data/bodenprobe_bereinigt.txt' using 1:2:3 w errorbars t'Messwerte' ls 1, \

unset output
