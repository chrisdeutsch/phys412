reset

set term epslatex color size 5,3.5

set decimalsign ","

set output './plots/modenabstand/ALL0028.tex'

set title ''

set key top right

set xrange [*:*]
set yrange [0:350]
set xlabel 'Zeit / 1000'
set ylabel 'Photospannung $I / \si{\milli\volt}$'

set grid

set samples 1000000

a1              = 5.3603
b1              = 0.12841  
a2              = 6.3341       
b2              = 0.17415      
a3              = 7.2323    
b3              = 0.18925     
a4              = 8.114        
b4              = 0.19765
a5              = 8.9988     
b5              = 0.16135      
a6              = 9.8339       
b6              = 0.092046     
a7              = 10.605       
b7              = 0.14901    
a8              = 11.37    
b8              = 0.17309  
a9              = 12.165
b9              = 0.17246
a10             = 12.947
b10             = 0.27870
c1              = 78.65
c2              = 241.02
c3              = 234.30
c4              = 225.48
c5              = 63.959
c6              = 59.364     
c7              = 237.29    
c8              = 231.60  
c9              = 222.02 
c10             = 43.739   
d               = 23.470


f(x) = d + c1*(b1**2/((x-a1)**2+b1**2)) + c2*(b2**2/((x-a2)**2+b2**2)) + c3*(b3**2/((x-a3)**2+b3**2)) + c4*(b4**2/((x-a4)**2+b4**2)) + c5*(b5**2/((x-a5)**2+b5**2)) + c6*(b6**2/((x-a6)**2+b6**2)) + c7*(b7**2/((x-a7)**2+b7**2)) + c8*(b8**2/((x-a8)**2+b8**2)) + c9*(b9**2/((x-a9)**2+b9**2)) + c10*(b10**2/((x-a10)**2+b10**2))

fit[x=4.232:13.5] f(x) './messwerte/modenabstand/ALL0028.txt' using ($1*1000):($2*1000):(1) every 2 via a1, b1, a2, b2, a3, b3, a4, b4, a5, b5, a6, b6, a7, b7, a8, b8, a9, b9, a10, b10, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, d

load './../gnuplot_linestyles.plt'

set arrow from 5.3603,0 to 5.3603,108 nohead lw 1.2
set arrow from 9.8339 ,0 to 9.8339,96  nohead lw 1.2

set arrow from 5.3603,35 to 9.8339,35 heads size 0.3,30 lw 1.2
set label 1  '$T_\text{konf.}$' at graph 0.3,0.05

plot 	'./messwerte/modenabstand/ALL0028.txt' using ($1*1000):($2*1000):(1) every 2 with yerrorbars ls 2 lw 2 t'Messwerte',\
    f(x) ls 1 lw 2 t'Anpassungskurve'\

unset output
