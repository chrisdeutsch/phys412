reset

set term epslatex color size 5,3.5

set decimalsign ","

set output './plots/modenabstand/template.tex'

set title ''

set key top right

set xrange [*:*]
set yrange [0:350]
set xlabel 'Zeit'
set ylabel 'Photospannung $I / \si{\milli\volt}$'

set grid

set samples 1000000

a1=0.00536
a2=0.00633
a3=0.00723
a4=0.00811
a5=0.00899
a6=0.00983
a7=0.0106
a8=0.01137
a9=0.01215
a10=0.0130
d=24

b1=0.00012
b2=0.00017
b3=0.00019
b4=0.0002
b5=0.00015
b6=0.0001
b7=0.00014
b8=0.00016
b9=0.00013
b10=0.00012

c1=78
c2=240
c3=243
c4=235
c5=63
c6=58
c7=240
c8=230
c9=210
c10=70


f(x) = d + c1*(b1**2/((x-a1)**2+b1**2)) + c2*(b2**2/((x-a2)**2+b2**2)) + c3*(b3**2/((x-a3)**2+b3**2)) + c4*(b4**2/((x-a4)**2+b4**2)) + c5*(b5**2/((x-a5)**2+b5**2)) + c6*(b6**2/((x-a6)**2+b6**2)) + c7*(b7**2/((x-a7)**2+b7**2)) + c8*(b8**2/((x-a8)**2+b8**2)) + c9*(b9**2/((x-a9)**2+b9**2)) + c10*(b10**2/((x-a10)**2+b10**2))

fit[x=0.004232:0.0135] f(x) './messwerte/modenabstand/ALL0028.txt' using 1:($2*1000):(1) every 2 via a1, b1, a2, b2, a3, b3, a4, b4, a5, b5, a6, b6, a7, b7, a8, b8, a9, b9, a10, b10, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, d

load './../gnuplot_linestyles.plt'

plot 	'./messwerte/modenabstand/ALL0028.txt' using 1:($2*1000):(1) every 2 with yerrorbars ls 2 lw 2 t'Messwerte',\
    f(x) ls 1 lw 2 t'Anpassungskurve'\

unset output
