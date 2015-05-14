reset

set term epslatex color size 5,3.5

set key top left

set decimalsign '{,}'

set xrange [0:35.0]
set yrange [0:*]
set xlabel 'Röhrenspannung $U / \si{kV}$'
set ylabel 'Ionisationsstrom $I_\mathrm{C} / \si{nA}$'

set xtics nomirror

set grid

load './../gnuplot_linestyles.plt'

#set bars small

set output './plots/abh_roehrenspannung/mo.tex'

#f(x) = m1 * x + b1

#fit f(x) './data/abh_roehrenspannung/mo.txt' using 1:5:2:6 xyerror via m1, b1

set x2tics ("\\footnotesize$\\mathrm{K}_\\alpha$" 17.4, "\\footnotesize$\\mathrm{K}_\\beta$" 19.6) rotate by 90 offset 0,0


plot './data/abh_roehrenspannung/mo.txt' using 1:5:2:6 w xyerrorbars t'Messdaten' ls 1


set output './plots/abh_roehrenspannung/cu.tex'

#g(x) = m2 * x + b2

#fit [0.0:0.4] g(x) './data/abh_roehrenspannung/cu.txt' using 1:5:2:6 xyerror via m2, b2

set x2tics ("\\footnotesize$\\mathrm{K}_\\alpha$" 8.04, "\\footnotesize$\\mathrm{K}_\\beta$" 8.91) rotate by 90 offset 0,0


plot './data/abh_roehrenspannung/cu.txt' using 1:5:2:6 w xyerrorbars t'Messdaten' ls 1

unset output