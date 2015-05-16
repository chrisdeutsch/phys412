reset

set term epslatex color size 5,3.5

set key top right

set decimalsign '{,}'

set xrange [0:3.1]
set yrange [*:*]
set xlabel 'Absorberdicke $d$ / \si{mm}'
set ylabel 'Transmission $T$ / \si{\percent}'
set format x "%.1f"
set grid

load './../gnuplot_linestyles.plt'

#set bars small

### PLOT 1
set output './plots/abschirmung/absorber_1.tex'

set ylabel 'Transmission $T$ / \si{\percent}'

plot './data/abschirmung/absorber_1.txt' using 1:9:(0.05):10 w xyerrorbars t'ohne Filter' ls 1,\
     './data/abschirmung/absorber_1_zr.txt' using 1:9:(0.05):10 w xyerrorbars t'Zr-Filter' ls 2



### PLOT 2 LOG
set output './plots/abschirmung/absorber_1_log.tex'

set ylabel 'Transmission $\ln(T)$'

set yrange [-5.5:0]


f(x) = m1 * x + b1
g(x) = m2 * x + b2

fit [0.75:3.1] f(x) './data/abschirmung/absorber_1.txt' using 1:(log($9/100.0)):(0.05):($10/$9) xyerror via m1, b1
fit [0.75:3.1] g(x) './data/abschirmung/absorber_1_zr.txt' using 1:(log($9/100.0)):(0.05):($10/$9) xyerror via m2, b2


plot './data/abschirmung/absorber_1.txt' using 1:(log($9/100.0)):(0.05):($10/$9) w xyerrorbars t'ohne Filter' ls 1,\
     './data/abschirmung/absorber_1_zr.txt' using 1:(log($9/100.0)):(0.05):($10/$9) w xyerrorbars t'Zr-Filter' ls 2,\
     f(x) t'Anpassung ohne Filter' ls 3,\
     g(x) t'Anpassung Zr-Filter' ls 4

unset output
