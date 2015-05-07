reset

set term epslatex color size 5,3.5

set output './plots/szintillator/untergrund.tex'

set key top right

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

unset key
set style fill solid 1.0

plot './data/szintillator/untergrund.txt' using 1:2:(sqrt($2)) w boxerror t'Messwerte' ls 1

unset output
