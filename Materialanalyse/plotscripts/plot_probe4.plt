reset

set term epslatex color size 5.5,3.5

set output './plots/probe4.tex'

set title 'Spektrum von Probe 4'

unset key

set xrange [32:192]
set xtics (32, 64, 96, 128, 160, 192)
set xtics nomirror
set x2range [1.50328:12.3081]
set x2tics nomirror (2, 4, 6, 8, 10, 12)
set mx2tics
set x2label 'Energie / $\si{\kilo\electronvolt}$'
set mxtics
set xlabel 'Kanalnummer'
set yrange [*:*]
set ylabel 'Counts'

set grid xtics x2tics ytics

set label 1 'K$_{\alpha}$(Co)' at graph 0.52,0.95
set label 2 'K$_{\beta}$(Co)' at graph 0.57,0.22
set label 3 'L$_{\alpha}$(Sm)' at graph 0.34,0.21

plot "./messdaten/materialanalyse/probe4.txt" using 1:2 with lines t'Messwerte' axis x1y1, "./messdaten/materialanalyse/probe4.txt" using ((-657.68+67.5264*($1))/1000):2 with lines t' ' axis x2y1 lt 1 lc 1

unset output