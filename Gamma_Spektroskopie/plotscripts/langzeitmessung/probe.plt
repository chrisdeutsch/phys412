reset

set term epslatex color size 5,3.5

set output './plots/langzeitmessung/probe.tex'

set key top right

set decimalsign '{,}'
#set format y "%.1f"

set xrange [1:*]
set yrange [0:*]
set xlabel 'Kanal $n$'
set ylabel 'Ereignisse $N$'

set samples 7000

set bars small

set grid

set grid x2tics ytics mx2tics

set xtics nomirror

set x2tics nomirror
set mx2tics 2
set x2label 'Energie / \si{\kilo\electronvolt}'
set link x2 via 0.2*x inverse x/0.2

#set style fill solid

load './../gnuplot_linestyles.plt'


plot './data/bodenprobe_bereinigt.txt' using 1:2:3 with yerrorbars t'Messwerte' ls 1, \

unset output
