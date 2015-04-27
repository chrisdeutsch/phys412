reset

set term epslatex color size 5,3.5

set output './plots/szintillator/caesium.tex'

set key top right

set decimalsign '{,}'
#set format y "%.1f"

set xrange [*:*]
set yrange [*:*]
set xlabel 'Kanal $n$'
set ylabel 'Ereignisse $$'

set grid

load './../gnuplot_linestyles.plt'


plot './data/szintillator/caesium.txt' using 1:2:(sqrt($2)) w boxerror t'Messwerte' ls 1

unset output
