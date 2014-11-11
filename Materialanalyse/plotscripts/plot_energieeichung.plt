reset

set term epslatex color size 5.5,3.5

set output './plots/energieeichung.tex'

set title 'Zusammenhang zwischen Kanalnummer und der Energie'

set key top left

set xrange [*:*]
set xtics
set mxtics
set xlabel 'Kanalnummer'
set yrange [*:*]
set ylabel "Energie $E / \\si{\\electronvolt}$"

set grid

f(x) = m * x + b
m=-800
b=70
fit f(x) "./messdaten/materialanalyse/eichdaten.txt" using 1:3 via m, b

plot "./messdaten/materialanalyse/eichdaten.txt" using 1:3:2 with xerrorbars t'abgelesene Werte', f(x) t'Fitgerade' lt 1 lc 1

unset output