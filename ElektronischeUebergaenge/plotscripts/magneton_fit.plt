reset

set term epslatex color size 5.2,3.5

set output './plots/magneton_fit.tex'

set title ''

set key top left

set xrange [350:700]
set yrange [0:*]
set xlabel 'B / $\si{\milli\tesla}$'
set ylabel 'E / $\si{\electronvolt}$'

set grid


f(x) = m1 * x
g(x) = m2 * x


# E- Fit
fit f(x) './messwerte/bestimmung_magneton.txt' using 1:(-$2):3 via m1

# E+ Fit
fit g(x) './messwerte/bestimmung_magneton.txt' using 1:4:5 via m2


load './../gnuplot_linestyles.plt'

plot 	'./messwerte/bestimmung_magneton.txt' using 1:(-$2):3 with yerrorbars ls 1 t'E-',\
    './messwerte/bestimmung_magneton.txt' using 1:4:5 with yerrorbars ls 2 t'E+',\
    f(x) ls 1 lw 2 t'E-',\
    g(x) ls 2 lw 2 t'E+',\
    5.78838e-8 * x ls 3 lw 2 t'Literatur'

unset output