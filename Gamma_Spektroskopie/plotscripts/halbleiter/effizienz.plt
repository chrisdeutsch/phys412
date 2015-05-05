reset

set term epslatex color size 5,3.5

set output './plots/halbleiter/effizienz.tex'

set key top right

set decimalsign '{,}'
#set format y "%.1f"

set xrange [0:1600]
set yrange [0:*]
set xlabel 'Gammaenergie $E_\gamma$'
set ylabel 'relative Effizienz $\eta$'

set grid

load './../gnuplot_linestyles.plt'

f(x) = a*exp(-x/b) + c
a = 8.5
b = 300.0
c = 1

fit f(x) './data/halbleiter/effizienz.txt' using 1:7:8 yerror via a,b,c

plot './data/halbleiter/effizienz.txt' using 1:7:8 w errorbars t'Messwerte' ls 1,\
f(x) t'Anpassung' ls 2

unset output
