reset

set term epslatex color size 5,3.5

set output './plots/abschirmung/koeffizienten.tex'

set key top left

set decimalsign '{,}'
set format y "%.0f"
set format x "%.0f"

set xlabel 'Ordnungszahl $Z$'
set ylabel 'Transmissionskoeffizient $\mu$ / \si{\per\centi\meter}'

set grid mxtics xtics ytics

load './../gnuplot_linestyles.plt'

set xrange [0:50]
set x2range[0:50]
set yrange [0:*]

set mxtics 2

set x2tics ('C' 6, 'Al' 13, 'Fe' 26, 'Cu' 29, 'Zr' 40, 'Ag' 47) nomirror

plot './data/abschirmung/koeffizienten.txt' using 1:2:3 with yerrorbars t'Messwerte' ls 1
unset output
