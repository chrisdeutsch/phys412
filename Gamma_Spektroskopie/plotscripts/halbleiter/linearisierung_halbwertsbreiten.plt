reset

set term epslatex color size 5,3.5

set output './plots/halbleiter/linearisierung_halbwertsbreiten.tex'

set key top left

set decimalsign '{,}'
#set format y "%.1f"

set xrange [0:1600]
set yrange [0:*]
set xlabel 'Gammaenergie $E_\gamma$'
set ylabel 'Halbwertsbreite $\Delta E^2$'

set grid

load './../gnuplot_linestyles.plt'

f(x) = m*x + b

fit f(x) './data/halbleiter/halbwertsbreiten.txt' using 1:($4**2):(2.0 * $4 * $5) via m, b

plot './data/halbleiter/halbwertsbreiten.txt' using 1:($4**2):(2.0 * $4 * $5) w errorbars t'Messwerte' ls 1, f(x) t'Anpassung' ls 2

unset output
