reset

set term epslatex color size 5,3.5

set output './plots/totzeit.tex'

set key top left

set decimalsign '{,}'
set format x "%.1f"

set xrange [0:1.1]
set yrange [0:*]
set xlabel 'Emissionsstrom $I_\text{E}$ / \si{mA}'
set ylabel 'Zählrate $R$ / \si{\per\second}'

set grid

load './../gnuplot_linestyles.plt'

a = 280
t = 1/(0.8*a)

f(x) = a * x * exp(a * x * t)

b = 2000
u = 1e-5

g(x) = 1 / ( u + 1/(b*x))

fit f(x) './data/totzeit.txt' using 1:3:2:4 xyerror via t, a
#fit[x=0.001:1] g(x) './data/totzeit.txt' using 1:3:2:4 xyerror via u, b

plot './data/totzeit.txt' using 1:3:2:4 w xyerrorbars t'Messwerte' ls 1,\
f(x) t'Anpassung' ls 2
#g(x) ls 3

unset output
