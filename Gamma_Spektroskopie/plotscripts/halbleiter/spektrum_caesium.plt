reset
#set term qt
set term epslatex color size 5,3.5

set output './plots/halbleiter/caesium.tex'

set key top left

set decimalsign '{,}'
#set format y "%.1f"

set xrange [0:*]
set yrange [0:*]
set xlabel 'Kanal $n$'
set ylabel 'Ereignisse $N$'

unset grid

set bars small
set style data lines

load './../gnuplot_linestyles.plt'

set label 2 "Rückstreupeak" at 917,1536 rotate left
set label 3 "Compton-Kante" at 2290,1300 rotate left
set label 4 "\\SI{661.660}{keV}" at 3513,18676 rotate left

unset key
set style fill solid 1.0

plot './data/halbleiter/caesium_bereinigt.txt' using 1:2:3  w boxerror t'Messwerte' ls 1

unset output
