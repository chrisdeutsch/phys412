reset

set term epslatex color size 5.5,3.5

set output './plots/kalibrierung.tex'

#set title 'Spektrum des FeZn-Kalibriertargets zur Energieeichung'

unset key

set xrange [*:256]
set xtics (0, 64, 128, 192, 256)
set xtics
set mxtics
set xlabel 'Kanalnummer'
set yrange [*:*]
set ylabel 'Counts'

set grid

set label 1 '$K_\alpha(\mathrm{Fe})$' at graph 0.3,0.95 font ',6'
set label 2 '$K_\beta(\mathrm{Fe})$' at graph 0.44,0.2 font ',6'
set label 3 '$K_\alpha(\mathrm{Zn})$' at graph 0.52,0.12 font ',6'
set label 4 '$K_\beta(\mathrm{Zn})$' at graph 0.57,0.05 font ',6'

set arrow from 105,0 to 105,7552 nohead
set arrow from 114,0 to 114,1380 nohead
set arrow from 137,0 to 137,780 nohead
set arrow from 152,0 to 152,135 nohead

plot "./messdaten/materialanalyse/eichprobe_FeZn.txt" using 1:2 with lines t'Messwerte'

unset output