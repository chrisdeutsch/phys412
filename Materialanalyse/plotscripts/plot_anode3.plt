reset

set term epslatex color size 5,3

set output './plots/anode3.tex'

set title 'Gemessene Z\"ahlrate für unterschiedliche Winkel bei Bragg-Beugung'

unset key

set xrange [*:*]
set xlabel 'Glanzwinkel $\beta$ / \si{\degree}'
set yrange [*:*]
set ylabel 'Z\"ahlrate / \si{\per\second}'

set grid

set label 1 '1' at graph 0.35,0.45
set label 2 '2' at graph 0.42,0.87
set label 3 '3' at graph 0.51,0.87
set label 4 '4' at graph 0.57,0.16
set label 5 '5' at graph 0.66,0.1
set label 6 '6' at graph 0.72,0.11
set label 7 '7' at graph 0.75,0.14
plot "./messdaten/anode3.txt" using 1:2:(0.05):($2)*0.05 with xyerrorbars t'Messwerte', "./messdaten/anode3.txt" using 1:2 with lines lt 1 lc 1

unset output