reset

set term epslatex color size 5,3.5

set output './plots/kalibrierung_szinti.tex'

set key top left

set decimalsign ','

set xrange [0:*]
set yrange [0:*]
set xlabel 'Linienschwerpunkt $n$'
set ylabel 'Gammaenergie $E_{\gamma}$ / \si{\kilo\electronvolt}'

set grid

load './../gnuplot_linestyles.plt'

f(x) = a * x**3 + b * x**2 + c * x + d

fit f(x) './data/energiekalibrierung/szintillator.txt' using 1:3 via a, b, c, d

plot './data/energiekalibrierung/szintillator.txt' using 1:3:2 w xerrorbars t'Messwerte' ls 1, f(x) ls 2 lw 2 t"Anpassung"

unset output
