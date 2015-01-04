reset

set term epslatex color size 5,3.5

set decimalsign ","

set output './plots/modenabstand/ALL0022.tex'

set title ''

set key top right

set xrange [*:11.4]
set yrange [0:350]
set xlabel 'Zeitablenkung $T$ / \si{\milli\second}'
set ylabel 'Photospannung $U_\text{PD} / \si{\milli\volt}$'

set grid

set samples 10000

a1              = 4.12238      #    +/- 0.006908     (0.111%)
b1              = 0.0899375    #   +/- 0.01127      (12.53%)
a2              = 4.6143       #   +/- 0.001767     (0.02539%)
b2              = 0.117384     #    +/- 0.00294      (2.504%)
a3              = 5.26936       #   +/- 0.001932     (0.02519%)
b3              = 0.183447     #    +/- 0.003456     (1.884%)
a4              = 5.64037       #   +/- 0.002056     (0.02466%)
b4              = 0.180712     #    +/- 0.003832     (2.121%)
a5              = 6.1322     #     +/- 0.002027     (0.02254%)
b5              = 0.179813   #      +/- 0.00378      (2.102%)
a6              = 6.54196     #     +/- 0.002086     (0.02163%)
b6              = 0.167161   #      +/- 0.003745     (2.24%)
a7              = 7.02918      #    +/- 0.003287     (0.03194%)
b7              = 0.129303     #    +/- 0.005541     (4.286%)
a8              = 7.8967       #   +/- 0.008449     (0.0779%)
b8              = 0.0565519   #     +/- 0.01297      (22.93%)
a9              = 8.327       #   +/- 0.001688     (0.01476%)
b9              = 0.0939751   #     +/- 0.002753     (2.929%)
a10             = 8.872      #    +/- 0.001833     (0.01529%)
b10             = 0.155673    #     +/- 0.003296     (2.117%)
a11             = 9.2      #    +/- 0.001984     (0.0158%)
b11             = 0.160024    #     +/- 0.003727     (2.329%)
a12             = 9.6298      #    +/- 0.00199      (0.01516%)
b12             = 0.16305       #   +/- 0.003765     (2.309%)
a13             = 10.013      #    +/- 0.002036     (0.01486%)
b13             = 0.151025    #     +/- 0.003715     (2.46%)
a14             = 10.40      #    +/- 0.003695     (0.02583%)
b14             = 0.179115    #     +/- 0.006841     (3.819%)
c1              = 120.1819      #    +/- 3.235        (7.855%)
c2              = 200.149      #    +/- 2.814        (1.52%)
c3              = 200.536      #    +/- 2.334        (1.054%)
c4              = 221.517      #    +/- 2.342        (1.107%)
c5              = 204.037      #    +/- 2.349        (1.098%)
c6              = 196.107      #    +/- 2.423        (1.236%)
c7              = 125.739      #    +/- 2.71         (2.563%)
c8              = 120.0136      #    +/- 4.02         (14.88%)
c9              = 200.54         #  +/- 3.133        (1.795%)
c10             = 200.713       #   +/- 2.516        (1.161%)
c11             = 220.487       #   +/- 2.48         (1.19%)
c12             = 200.355       #   +/- 2.462        (1.17%)
c13             = 200.89         #  +/- 2.514        (1.29%)
c14             = 120.99         #  +/- 2.318        (2.016%)
d               = 38  


f(x) = d + c1*(b1**2/((x-a1)**2+b1**2)) + c2*(b2**2/((x-a2)**2+b2**2)) + c3*(b3**2/((x-a3)**2+b3**2)) + c4*(b4**2/((x-a4)**2+b4**2)) + c5*(b5**2/((x-a5)**2+b5**2)) + c6*(b6**2/((x-a6)**2+b6**2)) + c7*(b7**2/((x-a7)**2+b7**2)) + c8*(b8**2/((x-a8)**2+b8**2)) + c9*(b9**2/((x-a9)**2+b9**2)) + c10*(b10**2/((x-a10)**2+b10**2)) + c11*(b11**2/((x-a11)**2+b11**2)) + c12*(b12**2/((x-a12)**2+b12**2)) + c13*(b13**2/((x-a13)**2+b13**2)) + c14*(b14**2/((x-a14)**2+b14**2))

fit[x=3.7:11.4] f(x) './messwerte/modenabstand/ALL0022.txt' using ($1*1000):($2*1000):(1) via a1, b1, a2, b2, a3, b3, a4, b4, a5, b5, a6, b6, a7, b7, a8, b8, a9, b9, a10, b10, a11, b11, a12, b12, a13, b13, a14, b14, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, d

load './../gnuplot_linestyles.plt'

plot 	'./messwerte/modenabstand/ALL0022.txt' using ($1*1000):($2*1000):(1) with yerrorbars ls 2 lw 2 t'Messwerte',\
    f(x) ls 1 lw 2 t'Anpassungskurve'\

unset output
