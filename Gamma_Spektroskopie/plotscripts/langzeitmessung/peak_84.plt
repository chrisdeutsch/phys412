reset

set term qt

#set term epslatex color size 5,3.5

#set output './plots/langzeitmessung/peak_84.tex'

set key top right

set decimalsign '{,}'
#set format y "%.1f"

set xrange [390:430]
set yrange [0:*]
set xlabel 'Kanal $n$'
set ylabel 'Ereignisse $N$'

set samples 7000

set bars small

set grid

set bars small
set style data lines

set grid x2tics ytics mx2tics

set xtics nomirror

set x2tics nomirror
set mx2tics 2
set x2label 'Energie / \si{\kilo\electronvolt}'
set link x2 via 0.2*x inverse x/0.2

set style fill solid

# FIT STARTWERTE

# Amplituden
a1 = 400
a2 = 400
a3 = 300

# Mittelwerte
b1 = 398
b2 = 410
b3 = 425

#Schwankungsbreiten
c1 = 2.9
c2 = 2
c3 = 2

# Untergrund
d = 0.1

# FIT

t(x)= a1*exp(-0.5*((x-b1)/c1)**2) + a2*exp(-0.5*((x-b2)/c2)**2) + a3*exp(-0.5*((x-b3)/c3)**2)

#Brutefroce
fit t(x) './data/bodenprobe_bereinigt.txt' using 1:2:3 yerror via a1, b1, c1, a2, b2, c2, a3, b3, c3
fit t(x) './data/bodenprobe_bereinigt.txt' using 1:2:3 yerror via a1
fit t(x) './data/bodenprobe_bereinigt.txt' using 1:2:3 yerror via b1
fit t(x) './data/bodenprobe_bereinigt.txt' using 1:2:3 yerror via c1
fit t(x) './data/bodenprobe_bereinigt.txt' using 1:2:3 yerror via a1
fit t(x) './data/bodenprobe_bereinigt.txt' using 1:2:3 yerror via b1
fit t(x) './data/bodenprobe_bereinigt.txt' using 1:2:3 yerror via c1
fit t(x) './data/bodenprobe_bereinigt.txt' using 1:2:3 yerror via a2
fit t(x) './data/bodenprobe_bereinigt.txt' using 1:2:3 yerror via b2
fit t(x) './data/bodenprobe_bereinigt.txt' using 1:2:3 yerror via c2
fit t(x) './data/bodenprobe_bereinigt.txt' using 1:2:3 yerror via a2
fit t(x) './data/bodenprobe_bereinigt.txt' using 1:2:3 yerror via b2
fit t(x) './data/bodenprobe_bereinigt.txt' using 1:2:3 yerror via c2
fit t(x) './data/bodenprobe_bereinigt.txt' using 1:2:3 yerror via a3
fit t(x) './data/bodenprobe_bereinigt.txt' using 1:2:3 yerror via b3
fit t(x) './data/bodenprobe_bereinigt.txt' using 1:2:3 yerror via c3
fit t(x) './data/bodenprobe_bereinigt.txt' using 1:2:3 yerror via a3
fit t(x) './data/bodenprobe_bereinigt.txt' using 1:2:3 yerror via b3
fit t(x) './data/bodenprobe_bereinigt.txt' using 1:2:3 yerror via c3
fit t(x) './data/bodenprobe_bereinigt.txt' using 1:2:3 yerror via a1, b1, c1, a2, b2, c2, a3, b3, c3

g(x) = a*exp(-0.5*((x-b)/c)**2) # Gaußfit
u(x) = d				# Untergrund

load './../gnuplot_linestyles.plt'

plot './data/bodenprobe_bereinigt.txt' using 1:2:3 w errorbars t'Messwerte' ls 1, \
	t(x) t'$\Sigma$' ls 2 lw 2,\
	g(x) t'$\mathcal{G}_1$' ls 3 lw 2,\
	u(x) t'$d$' ls 5 lw 2

unset output
