reset

set term epslatex color size 5,3.5

set output './plots/fermi_tl.tex'

set key top right

set decimalsign '{,}'

set xrange [1:3]
set yrange [0:*]
set xlabel '$\epsilon$'
set ylabel '$F(Z = \num{82},\epsilon)$'

set grid

load './../gnuplot_linestyles.plt'


f(x) = sqrt(A + B / (x-1))
A = 161
B = 403


fit f(x) './data/fermi_tl.txt' using (sqrt($1**2 + 1)):2 via A, B

plot 	'./data/fermi_tl.txt' using (sqrt($1**2 + 1)):2  t'tabellierte Werte' ls 1, f(x) t'Fermifunktion' ls 2

unset output
