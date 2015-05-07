reset
#set term qt
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

set label 1 "1,2,3" at 349,1050 center
#set label 2 "2,3,4" at 360,1100 center
#set label 3 "3" at 397,1100 center
set label 4 "4" at 411,550 center
set label 5 "5" at 425,477 center
set label 6 "6,7" at 1165,1100 center
#set label 7 "7" at 1180,1100 center
set label 8 "8" at 1447,402 center
set label 9 "9" at 1661,270 center
set label 10 "10" at 1729,495 center
set label 11 "11" at 2520,204 center
set label 12 "12" at 2880,333 center
set label 13 "13" at 3010,396 center
set label 14 "14" at 3269,315 center
set label 15 "15" at 3597,130 center
set label 16 "16" at 4513,260 center
set label 17 "17,18" at 4779,160 center
#set label 18 "18" at 4801,1100 center
set label 19 "19" at 5554,140 center
set label 20 "20" at 7249,584 center



unset key
set style fill solid 1.0

plot './data/bodenprobe_bereinigt.txt' using 1:2:3 with boxerror t'Messwerte' ls 1, \

unset output
