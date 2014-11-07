set term epslatex color size 5,3

set output './plots/anode3_fit.tex'

set title 'Gemessene Z\"ahlrate für unterschiedliche Winkel bei Bragg-Beugung'

set key top right

set xrange [*:*]
set xlabel 'Sinus des Glanzwinkels $\theta$'
set yrange [*:*]
set ylabel 'Z\"ahlrate / \si{\per\second}'

set grid

f(x)= 
fit f(x) 

plot "./messdaten/anode3.txt" using sin($1):2 smooth unique t'Messwerte #x-Fehler: ($3)*cos($3), f(x) t'Fitkurve'

unset output