reset

set term epslatex color size 5,3.5

set output './plots/kondensatorspannung.tex'

set key top left

set decimalsign ','

set xrange [0:*]
set yrange [0:6.5]
set xlabel 'Kondensatorspannung $U_\mathrm{C} / \si{V}$'
set ylabel 'Ionisationsstrom $I_\mathrm{C} / \si{nA}$'

set grid

load './../gnuplot_linestyles.plt'

#set bars small

plot './data/kondensator/15kV.txt' using 1:5:2:6 w xyerrorbars t'$U = \SI{15}{kV}$' ls 1,\
     './data/kondensator/25kV.txt' using 1:5:2:6 w xyerrorbars t'$U = \SI{25}{kV}$' ls 2,\
     './data/kondensator/35kV.txt' using 1:5:2:6 w xyerrorbars t'$U = \SI{35}{kV}$' ls 3

unset output
