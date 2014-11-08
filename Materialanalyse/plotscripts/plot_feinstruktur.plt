reset

set term epslatex color size 5,3

set output './plots/feinstruktur.tex'

set title 'Gemessene Z\"ahlrate für unterschiedliche Winkel bei Bragg-Beugung (Feinstrukturaufspaltung)'

unset key

set xrange [*:*]
set xlabel 'Glanzwinkel $\beta$ / \si{\degree}'
set yrange [*:*]
set ylabel 'Z\"ahlrate / \si{\per\second}'

set grid

set label 1 '1' at graph 0.49,0.95
set label 2 '2' at graph 0.53,0.61
plot "./messdaten/feinstruktur.txt" using 1:2:(0.02):($2)*0.05 with xyerrorbars t'Messwerte', "./messdaten/feinstruktur.txt" using 1:2 with lines lt 1 lc 1

unset output