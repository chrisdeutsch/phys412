reset

set term epslatex color size 5,3.5

set output './plots/totzeitkorrektur.tex'

set key top left

set decimalsign '{,}'
set format x "%.0f"
set format y "%.2f"

set xrange [0:2000]
set yrange [1:1.1]
set xlabel 'gemessene Rate $k$ / \si{\per\second}'
set ylabel 'Totzeitkorrekturfaktor $\frac{m(k)}{k}$'

set grid

load './../gnuplot_linestyles.plt'



plot './data/totzeitkorrektur.tsv' using 1:2 smooth csplines t'Messwerte' ls 1

unset output
