reset

set term qt

#set term epslatex color size 5,3.5

#set output './plots/langzeitmessung/peak_1460.tex'

set key top right

set decimalsign '{,}'
#set format y "%.1f"

set xrange [7244:7255]
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
a = 500

# Mittelwerte
b = 7249

#Schwankungsbreiten
c = 3.5

# Untergrund
d = 0.1

# FIT

t(x)= a*exp(-0.5*((x-b)/c)**2)

#Brutefroce
fit t(x) './data/bodenprobe_bereinigt.txt' using 1:2:3 yerror via a, b, c
fit t(x) './data/bodenprobe_bereinigt.txt' using 1:2:3 yerror via a
fit t(x) './data/bodenprobe_bereinigt.txt' using 1:2:3 yerror via b
fit t(x) './data/bodenprobe_bereinigt.txt' using 1:2:3 yerror via c
fit t(x) './data/bodenprobe_bereinigt.txt' using 1:2:3 yerror via a
fit t(x) './data/bodenprobe_bereinigt.txt' using 1:2:3 yerror via b
fit t(x) './data/bodenprobe_bereinigt.txt' using 1:2:3 yerror via c
fit t(x) './data/bodenprobe_bereinigt.txt' using 1:2:3 yerror via a, b, c

g(x) = a*exp(-0.5*((x-b)/c)**2) # Gaußfit
u(x) = d				# Untergrund

load './../gnuplot_linestyles.plt'

plot './data/bodenprobe_bereinigt.txt' using 1:2:3 w errorbars t'Messwerte' ls 1, \
	t(x) t'$\Sigma$' ls 2 lw 2,\
	g(x) t'$\mathcal{G}_1$' ls 3 lw 2,\
	u(x) t'$d$' ls 5 lw 2

unset output
