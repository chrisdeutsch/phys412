reset

set term epslatex color size 5,3.5

set output './plots/abweichung_wellenlaenge.tex'

set title ''

set key bottom right

set xrange [0:100]
set yrange [*:*]
set xlabel '$y_n \, / \, \si{\centi\metre}$'
set ylabel '$\frac{\lambda}{\lambda} \, / \, \si{\percent}$'

set grid

load './../gnuplot_linestyles.plt'

x0 =252
y0 = 9.85
f(x) = 100*(0.5*(x**2 - y0**2) / x0**2 /(x0/sqrt(x0**2+y0**2) - x0/sqrt(x0**2 + x**2))-1)

plot f(x) ls 1 t'relative Abweichung'

unset output