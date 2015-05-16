reset

set term epslatex color size 5,3.5

set key top left

set decimalsign '{,}'

set xrange [0:*]
set yrange [*:*]
set xlabel 'Absorberdicke $d$ / \si{mm}'
set ylabel 'Transmission $T$ / \si{\percent}'

set grid

load './../gnuplot_linestyles.plt'

#set bars small

### PLOT 1
set output './plots/abschirmung/absorber_1.tex'

f(x) = m*x
fit f(x) './data/abschirmung/absorber_1.txt' using 1:(log($9/100.0)):($10/$9) yerror via m

plot './data/abschirmung/absorber_1.txt' using 1:(log($9/100.0)):($10/$9) w yerrorbars t'Absorber 1' ls 1,\
     f(x) t'Fit' ls 2



### PLOT 2
set output './plots/abschirmung/absorber_1_zr.tex'

g(x) = m*x
fit g(x) './data/abschirmung/absorber_1_zr.txt' using 1:(log($9/100.0)):($10/$9) yerror via m

plot './data/abschirmung/absorber_1_zr.txt' using 1:(log($9/100.0)):($10/$9) w yerrorbars t'Absorber 1' ls 1,\
     g(x) t'Fit' ls 2

unset output
