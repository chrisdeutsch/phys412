reset

set term epslatex color size 5.5,3.5

set output './plots/probe2.tex'

set title 'Spektrum von Probe 2'

unset key

set xrange [*:512]
set xtics (0, 128, 256, 384, 512)
set xtics nomirror
set x2range [-0.829619:34.066765]
set x2tics nomirror (0, 5, 10, 15, 20, 25, 30)
set mx2tics
set x2label 'Energie / $\si{\kilo\electronvolt}$'
set mxtics
set xlabel 'Kanalnummer'
set yrange [*:*]
set ylabel 'Counts'

set grid xtics x2tics ytics

plot "./messdaten/materialanalyse/probe2.txt" using 1:2 with lines t'Messwerte' axis x1y1, "./messdaten/materialanalyse/probe2.txt" using ((-725.206+67.5264*($1))/1000):2 with lines t' ' axis x2y1 lt 1 lc 1

unset output