reset

set term epslatex color size 5,3.5

set output './plots/roentgenspektrum.tex'

unset key

set xrange [2:25]
set xtics (2,5,10,15,20,25)
set mxtics (3,4,6,7,8,9,11,12,13,14,16,17,18,19,21,22,23,24,25)
set xlabel 'Glanzwinkel $\beta$ / \si{\degree}'
set yrange [*:*]
set ylabel 'Z\"ahlrate / \si{\per\second}'

set grid xtics ytics

#set label 1 '1' at graph 0.4,0.5
#set label 2 '2' at graph 0.49,0.95
#set label 3 '3' at graph 0.58,0.95
#set label 4 '4' at graph 0.67,0.14
#set label 5 '5' at graph 0.78,0.09
#set label 6 '6' at graph 0.87,0.11
#set label 7 '7' at graph 0.9,0.14

load './../gnuplot_linestyles.plt'

plot "./figures/roentgenspektrum/anode3.txt" using 1:2 with lines t'Wolfram' ls 1 lw 2

unset output