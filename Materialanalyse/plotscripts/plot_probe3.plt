reset

set term epslatex color size 5.5,3.5

set output './plots/probe3.tex'

#set title 'Spektrum von Probe 3'

unset key

set xrange [64:224]
set xtics (64, 96, 128, 160, 192, 224)
set xtics nomirror
set x2range [3.664:14.47]
set x2tics nomirror (4, 6, 8, 10, 12, 14)
set mx2tics
set x2label 'Energie / $\si{\kilo\electronvolt}$'
set mxtics
set xlabel 'Kanalnummer'
set yrange [*:*]
set ylabel 'Counts'

set grid xtics x2tics ytics


set label 1 'K$_{\alpha}$(Cu)' at graph 0.42,0.95
set label 2 'K$_{\alpha}$(Zn)' at graph 0.47,0.7
set label 3 'K$_{\beta}$(Zn)' at graph  0.55,0.07

plot "./messdaten/materialanalyse/probe3.txt" using 1:2 with lines t'Messwerte' axis x1y1, "./messdaten/materialanalyse/probe3.txt" using ((-657.68+67.5264*($1))/1000):2 with lines t' ' axis x2y1 lt 1 lc 1

unset output