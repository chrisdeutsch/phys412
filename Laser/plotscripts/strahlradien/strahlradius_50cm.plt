reset

set term epslatex color size 5,3.5

set output './plots/strahlradien/strahlradius_50cm.tex'

set title ''

set key top left

set xrange [0:500]
set yrange [*:*]
set xlabel 'Abstand von der Strahltaille $z \, / \, \si{\milli\metre}$'
set ylabel 'Strahlradius $w \, / \, \si{\milli\metre}$'

set decimalsign ','

set grid

# Resonatorlänge
L = 500.0 #mm

# Konstanten
lambda = 0.0006328 #mm
R = 1000.0 #mm
g = 1.0 - L/R
w0_theo = sqrt(L * lambda / pi * sqrt(g / (1-g)) )

# theoretischer Strahlradius
w_theo(x) = w0_theo * sqrt(1 + (lambda/pi)**2 * (x / w0_theo**2)**2)



# Anpassung an die experimentellen Werte
w_fit(x) = c * w0 * sqrt(1 + (lambda/pi)**2 * (x / w0**2)**2)

fit w_fit(x) './messwerte/strahlradien/strahlradien_50cm.txt' using 1:($3/2.0):($4/2.0) via w0, c

# experimenteller Strahlradius
w_exp(x) = w0 * sqrt(1 + (lambda/pi)**2 * (x / w0**2)**2)


load './../gnuplot_linestyles.plt'

plot 	'./messwerte/strahlradien/strahlradien_50cm.txt' using 1:($3/2.0):2:($4/2.0) with xyerrorbars ls 1 t'Messwerte',\
w_fit(x) t'$\alpha \cdot w_\mathrm{exp.}(z)$' ls 2,\
w_exp(x) t'$w_\mathrm{exp.}(z)$' ls 3,\
w_theo(x) t'$w_\mathrm{theo.}(z)$' ls 4

unset output