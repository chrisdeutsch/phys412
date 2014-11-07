set term epslatex color size 5,3

set output './plots/anode3.tex'

set title 'Gemessene Z\"ahlrate für unterschiedliche Winkel bei Bragg-Beugung'

set key top right
set key box

set xrange [*:*]
set xlabel 'Glanzwinkel $\theta$ / \si{\deg}'
set yrange [*:*]
set ylabel 'Z\"ahlrate'

set grid

plot "../messdaten/anode3.txt" using 1:2 smooth unique t'Zählrate'

unset output