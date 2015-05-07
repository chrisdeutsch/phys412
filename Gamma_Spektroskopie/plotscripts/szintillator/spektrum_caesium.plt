reset
#set term qt
set term epslatex color size 5,3.5

set output './plots/szintillator/caesium.tex'

set key top right

set decimalsign '{,}'
#set format y "%.1f"

set xrange [0:5000]
set yrange [0:*]
set xlabel 'Kanal $n$'
set ylabel 'Ereignisse $N$'

unset grid

load './../gnuplot_linestyles.plt'

set label 1 "Röntgenlinie" at 340,800 rotate left
set label 2 "Rückstreupeak" at 1129,760 rotate left
set label 3 "Compton-Kante" at 2560,320 rotate left
set label 4 "\\SI{661.660}{keV}" at 4130,800 rotate left

set bars small
set style data lines

unset key
set style fill solid 1.0

plot './data/szintillator/caesium_bereinigt.txt' using 1:2:3 w boxerror t'Messwerte' ls 1

unset output
