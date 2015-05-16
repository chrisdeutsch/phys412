reset

set term epslatex color size 5,3.5

set output './plots/theo_totzeitkorrektur.tex'

set key center right

set decimalsign '{,}'
set format y "%.1f"
set format x "%.1f"

set xlabel 'tatsächliche Rate $m$'
set ylabel 'gemessene Rate $k$'

unset xtics
unset ytics


unset grid

load './../gnuplot_linestyles.plt'


tau = 0.75

set xrange [0:10]
set yrange [0:1/tau]
set xtics ('$\frac{1}{\tau}$' 1/tau, '$\frac{2}{\tau}$' 2/tau, '$\frac{3}{\tau}$' 3/tau, '$\frac{4}{\tau}$' 4/tau, '$\frac{5}{\tau}$' 5/tau, '$\frac{6}{\tau}$' 6/tau, '$\frac{7}{\tau}$' 7/tau)
set ytics ('$\frac{1}{\tau}$' 1/(tau), '$\frac{3}{4\tau}$' 3/(4*tau), '$\frac{1}{4\tau}$' 1/(4*tau), '$\frac{1}{2\tau}$' 1/(2*tau))


f(x) = x / (1 + x * tau)
g(x) = x * exp(-x * tau)

plot f(x) t'paralysierend' ls 1,\
     g(x) t'nicht-paralysierend' ls 2

unset output
