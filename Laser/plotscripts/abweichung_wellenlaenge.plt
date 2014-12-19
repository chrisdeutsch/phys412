reset

set term epslatex color size 5,3.5

set output './plots/abweichung_wellenlaenge.tex'

set title ''

set key top left

set xrange [0:100]
set yrange [*:*]
set xlabel 'Position des Beugungsmaximums $y_n \, / \, \si{\centi\metre}$'
set ylabel 'relative Abweichung $\frac{\Delta \lambda}{\lambda} \, / \, \si{\percent}$'

unset grid

load './../gnuplot_linestyles.plt'

x0 =252
y0 = 9.85
f(x) = 100*(0.5*(x**2 - y0**2) / x0**2 /(x0/sqrt(x0**2+y0**2) - x0/sqrt(x0**2 + x**2))-1)

set arrow from 40.55,f(40.55)+2 to 40.55,f(40.55) filled ls 2 lw 3
set label '$y_{19} = \SI{40.55}{\centi\metre}$' at 40.55,f(40.55)+2.5 center
plot f(x) ls 1 t'relative Abweichung'

unset output