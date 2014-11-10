reset

set term epslatex color size 5.5,3.5

set output './plots/kalibrierung.tex'

set title 'Spektrum des FeZn-Kalibriertargets zur Energieeichung'

unset key

set xrange [*:512]
set xtics (0, 128, 256, 384, 512)
set xtics
set mxtics
set xlabel 'Kanalnummer'
set yrange [*:*]
set ylabel 'Counts'

set grid

plot "./messdaten/materialanalyse/eichprobe_FeZn.txt" using 1:2 with lines t'Messwerte'

unset output