reset

set term epslatex color size 5.5,3.5

set output './plots/probe1.tex'

set title 'Spektrum von Probe 1'

unset key

set xrange [*:256]
set xtics (0, 64, 128, 192, 256)
set xtics nomirror
set x2range [-0.65768:16.6290784]
set x2tics nomirror (0, 5, 10, 15)
set mx2tics
set x2label 'Energie / $\si{\kilo\electronvolt}$'
set mxtics 63
set xlabel 'Kanalnummer'
set yrange [*:*]
set ylabel 'Counts'

set grid xtics x2tics ytics

plot "./messdaten/materialanalyse/probe1.txt" using 1:2 with lines t'Messwerte' axis x1y1, "./messdaten/materialanalyse/probe1.txt" using ((-657.68+67.5264*($1))/1000):2 with lines t' ' axis x2y1 lt 1 lc 1

unset output