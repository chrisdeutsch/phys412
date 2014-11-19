reset

set term epslatex color size 4,3

set output './plots/fabry_perot_transmission.tex'

set title ''

set nokey

set samples 5000

set xrange [3:16]
set yrange [0:1.1]
set ytics (0, 0.2, 0.4, 0.6, 0.8, 1)
set xlabel 'Wellenl\"ange $\lambda$'
set ylabel 'Transmissionsgrad'
set noxtics

unset grid

g(x)=1/(1+F*sin(x/2)**2)
F= 40 #Finesse
#C=1e4

#Halbwertsbreite einzeichnen
set arrow from 4.5,0.5 to 5.95564,0.5 head size 0.4,30 lw 1.5
set arrow from 8.1,0.5 to 6.62076,0.5 head size 0.4,30 lw 1.5

#freier Spektralbereich einzeichnen
set arrow from 6.3,1 to 12.54,1 heads size 0.42,30 lw 1.5

set label 1  '$\delta\lambda$' at graph 0.31,0.4
set label  2 '$\Delta\lambda$' at graph 0.43,0.87

plot g(x) lw 2

unset output