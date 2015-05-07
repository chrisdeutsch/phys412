reset
#set term qt
set term epslatex color size 5,3.5

set output './plots/halbleiter/cobalt.tex'

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

set label 2 "Rückstreupeak" at 1080,720 rotate left
set label 3 "Compton-Kanten" at 4740,860 rotate left
set label 4 "\\SI{1173.237}{keV}" at 6050,7230 rotate left
set label 5 "\\SI{1332.501}{keV}" at 6870,5900 rotate left
set arrow from 4885,2000 to 5400,400

unset key
set style fill solid 1.0

plot './data/halbleiter/cobalt_bereinigt.txt' using 1:2:3  w boxerror t'Messwerte' ls 1

unset output
