reset

set term epslatex color size 5,3.5

set output './plots/kalibrierung_szinti.tex'

set key top left

set decimalsign ','

set xrange [0:1500]
set yrange [0:*]
set xlabel 'Gammaenergie $E_{\gamma}$ / \si{\kilo\electronvolt}'
set ylabel 'Linienschwerpunkt $n$'

set grid

load './../gnuplot_linestyles.plt'

f(x) = a * x**3 + b * x**2 + c * x + d

fit[x=0:1200] f(x) './data/energiekalibrierung/szintillator.txt' using 3:1:2 yerror via a, b, c, d

plot './data/energiekalibrierung/szintillator.txt' using 3:1:2 w yerrorbars t'Messwerte' ls 1, f(x) ls 2 lw 2 t"Anpassung"

unset output
