reset

set term epslatex color size 5,3.5

set output './plots/langzeitmessung/spektrum.tex'

set key top left

set decimalsign '{,}'
#set format y "%.1f"

set xrange [1:*]
set yrange [0:*]
set xlabel 'Kanal $n$'
set ylabel 'Ereignisse $N$'

set grid

set bars small
set style data lines

set grid xtics ytics

set xtics nomirror

set x2tics nomirror
set x2label 'Energie / \si{\kilo\electronvolt}'
set link x2 via 0.2*x inverse x/0.2

load './../gnuplot_linestyles.plt'

plot './data/bodenprobe_bereinigt.txt' using 1:2:3 w errorbars t'Messwerte' ls 1, \
	'./data/bodenprobe_bereinigt.txt' using 1:2:3 w errorbars axis x2y1 t'' ls 1

unset output
