reset

set term epslatex color size 5,3.5

set key top left

set decimalsign '{,}'

set xrange [0:1.0]
set yrange [0:*]
set xlabel 'Emissionsstrom $I_\mathrm{E} / \si{mA}$'
set ylabel 'Ionisationsdosisleistung $\braket{j} / \si{\micro\ampere\per\kilogram}$'
set y2label 'Äquivalentdosisleistung $\dot{H} / \si{\sievert\per\hour}$'

unset grid

load './../gnuplot_linestyles.plt'

set link y2 via 0.11664*y inverse y/0.11664
set ytics nomirror
set y2tics nomirror


set output './plots/dosis_emissionsstrom/mo.tex'

plot './data/abh_emissionsstrom/mo.txt' using 1:($5 / 1.45e-4 * 1e-3):2:($5 / 1.45e-4 * sqrt($6**2 / $5**2 + 0.13**2/1.45**2) * 1e-3) w xyerrorbars t'Messdaten' ls 1



set output './plots/dosis_emissionsstrom/cu.tex'

plot './data/abh_emissionsstrom/cu.txt' using 1:($5 / 1.45e-4 * 1e-3):2:($5 / 1.45e-4 * sqrt($6**2 / $5**2 + 0.13**2/1.45**2) * 1e-3) w xyerrorbars t'Messdaten' ls 1

unset output