reset

set term epslatex color size 6,4

set output './plots/feinstruktur.tex'

set title 'Gemessene Z\"ahlrate für unterschiedliche Winkel bei Bragg-Beugung (Feinstrukturaufspaltung)'

unset key

set xrange [*:*]
set xlabel 'Glanzwinkel $\beta$ / \si{\degree}'
set yrange [*:*]
set ylabel 'Z\"ahlrate / \si{\per\second}'

set grid

set label 1 '1' at graph 0.48,0.9
set label 2 '2' at graph 0.54,0.56
plot "./messdaten/feinstruktur.txt" using 1:2 with lines t'Messwerte'

unset output