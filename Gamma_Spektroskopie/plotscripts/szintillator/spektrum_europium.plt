reset
#set term qt
set term epslatex color size 5,3.5

set output './plots/szintillator/europium.tex'

set key top right

set decimalsign '{,}'
#set format y "%.1f"

set xrange [0:7000]
set yrange [0:*]
set xlabel 'Kanal $n$'
set ylabel 'Ereignisse $N$'

unset grid

set bars small
set style data lines

load './../gnuplot_linestyles.plt'

set label 2 "Röntgenlinie" at 410,3100 rotate left
set label 4 "\\SI{121.783}{keV}" at 730,2224 rotate left
set label 5 "\\SI{244.699}{keV}" at 1440,592 rotate left
set label 6 "\\SI{344.281}{keV}" at 1990,675 rotate left
set label 7 "\\SI{778.903}{keV}" at 4513,250 rotate left
set label 8 "\\SI{964.131}{keV}" at 5528,240 rotate left
set label 9 "\\SI{1112.116}{keV}" at 6025,322 rotate left
set label 10 "\\SI{1408.011}{keV}" at 6620,270 rotate left

unset key
set style fill solid 1.0

plot './data/szintillator/europium_bereinigt.txt' using 1:2:3 w boxerror t'Messwerte' ls 1

unset output
