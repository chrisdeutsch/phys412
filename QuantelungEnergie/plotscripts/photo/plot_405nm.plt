reset

set term epslatex color size 5,3.5

set output './plots/photo/kennlinien_405nm.tex'

set title ''

set key top right

set xrange [0:*]
set yrange [0:*]
set xlabel '$U \, / \, \si{\volt}$'
set ylabel '$\sqrt{I-I_0} \, / \, \si{\nano\ampere^{1/2}}$'

set grid


f(x) = m1 * x + n1
g(x) = m2 * x + n2

# Range auf den quadratischen Bereich einstellen
fit[x=0.0:1.1] f(x) './messwerte/Photoeffekt/photo_405nm_1.txt' using 1:3:4 via m1, n1
fit[x=0.0:1.1] g(x) './messwerte/Photoeffekt/photo_405nm_2.txt' using 1:3:4 via m2, n2

load './../gnuplot_linestyles.plt'

plot 	'./messwerte/Photoeffekt/photo_405nm_1.txt' using 1:3:2:4 with xyerrorbars ls 1 t'Messung 1',\
		f(x) ls 1 t'Regressionsgerade 1',\
		'./messwerte/Photoeffekt/photo_405nm_2.txt' using 1:3:2:4 with xyerrorbars ls 2 t'Messung 2',\
		g(x) ls 2 t'Regressionsgerade 2'

unset output