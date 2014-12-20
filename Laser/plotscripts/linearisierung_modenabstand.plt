reset

set term epslatex color size 5,3.5

set output './plots/linearisierung_modenabstand.tex'

set title ''

set key bottom right

set xrange [3.0:6.0]
set yrange [*:*]
set xlabel '$\frac{1}{\nu_\mathrm{HF}} \, / \, \si{\nano\second}$'
set ylabel '$2 L \, / \, \si{\centi\metre}$'

set decimalsign ','

set grid


f(x) = m1 * x

fit f(x) './messwerte/modenabstand_schwebung.txt' using (1000.0/$3):(2*$1):(2*$2) via m1

load './../gnuplot_linestyles.plt'

plot 	'./messwerte/modenabstand_schwebung.txt' using (1000.0/$3):(2*$1):(1000*$4/$3**2):(2*$2) with xyerrorbars ls 1 t'Datenpunkte',\
		f(x) ls 2 t'Anpassungsgerade'

unset output