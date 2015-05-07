reset

set term epslatex color size 8,5.6

set output './plots/langzeitmessung/probe_gross.tex'

set key top right

set decimalsign '{,}'
#set format y "%.1f"

set xrange [1:8000]
set yrange [0:*]
set xlabel 'Kanal $n$'
set ylabel 'Ereignisse $N$'

set samples 7000

set bars small

set grid x2tics ytics mx2tics

set xtics nomirror

set x2tics nomirror
set mx2tics 2
set x2label 'Energie / \si{\kilo\electronvolt}'
set link x2 via 0.200839*x+4.589 inverse (x-4.589)/0.200839

#set style fill solid

load './../gnuplot_linestyles.plt'

unset key
set style fill solid 1.0

plot './data/bodenprobe_bereinigt.txt' using 1:2:3 with boxerror t'Messwerte' ls 1, \

unset output
