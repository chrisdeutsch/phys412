reset

set term epslatex color size 5,3.5

set output './plots/langzeitmessung/untergrund.tex'

set key top right

set decimalsign '{,}'
#set format y "%.1f"

set xrange [0:*]
set yrange [0:*]
set xlabel 'Kanal $n$'
set ylabel 'Ereignisse $$'

set grid

set bars small
set style data lines

load './../gnuplot_linestyles.plt'

scale = 0.703783

plot './data/untergrund.txt' using 1:($2*scale):(sqrt($2) * scale) w errorbars t'Messwerte' ls 1

unset output
