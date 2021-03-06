reset
#set term qt
set term epslatex color size 5,3.5

set output './plots/szintillator/cobalt.tex'

set key top left

set decimalsign '{,}'
#set format y "%.1f"

set xrange [0:8000]
set yrange [0:*]
set xlabel 'Kanal $n$'
set ylabel 'Ereignisse $N$'

unset grid

set bars small
set style data lines

load './../gnuplot_linestyles.plt'

set label 2 "Rückstreupeaks" at 1342,400 rotate left
set label 3 "Compton-Kanten" at 5490,257 rotate left
set label 4 "\\SI{1173.237}{keV}" at 5910,650 rotate left
set label 5 "\\SI{1332.501}{keV}" at 6830,650 rotate left
set arrow from 5650,320 to 5912,231

unset key
set style fill solid 1.0

plot './data/szintillator/cobalt_bereinigt.txt' using 1:2:3  w boxerror t'Messwerte' ls 1

unset output
