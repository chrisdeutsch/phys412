reset

set term epslatex color size 5,3.5

set output './plots/kalibrierung_szinti.tex'

set key top left

set decimalsign ','

set xrange [0:7000]
set yrange [0:*]
set xlabel 'Linienschwerpunkt $n$'
set ylabel 'Gammaenergie $E_{\gamma}$ / \si{\kilo\electronvolt}'

set grid

load './../gnuplot_linestyles.plt'

f(x) = a * x + b
g(x) = c * x + d

fit[x=0:6000] f(x) './data/energiekalibrierung/szintillator.txt' using 1:3 via a, b
fit[x=6000:7000] g(x) './data/energiekalibrierung/szintillator.txt' using 1:3 via c, d

plot    './data/energiekalibrierung/szintillator.txt' using 1:3:2 w xerrorbars t'Messwerte' ls 1,\
        0 <= x && x <= 6500 ? f(x) : 1/0 ls 2 lw 2  t'Anpassung', \
        5500 <= x && x <= 7000 ? g(x) : 1/0 ls 2 lw 2 t'Anpassung'

unset output
