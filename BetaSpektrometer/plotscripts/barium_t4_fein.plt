reset

set term epslatex color size 5,3.5

set output './plots/barium_t4_fein.tex'

set key top right

set decimalsign '{,}'

set xrange [*:*]
set yrange [*:*]
set xlabel '$U_\mathrm{H}$ / \si{\skt}'
set ylabel '$n$'

set grid

load './../gnuplot_linestyles.plt'

# Zwei Gauß mit Offset
g(x) = a * exp(-(x - b)**2 / (2 * c**2)) + d * exp(-(x - e)**2 / (2 * f**2)) + g
a = 1
b = 152
c = 1
d = 0.5
e = 155
f = 1.5
g = 0.2


fit g(x) './data/barium_t4_fein.txt' using 1:3:4 yerror via a,b,c,d,e,f,g

plot [147:159] './data/barium_t4_fein.txt' using 1:3:2:4 w xyerrorbars t'Messwerte' ls 1, g(x) ls 2 lw 2

unset output
