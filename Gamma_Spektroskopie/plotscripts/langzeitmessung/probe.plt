reset

set term epslatex color size 5,3.5

set output './plots/langzeitmessung/probe.tex'

set key top right

set decimalsign '{,}'
#set format y "%.1f"

set xrange [343:355]
set yrange [0:*]
set xlabel 'Kanal $n$'
set ylabel 'Ereignisse $N$'

set samples 7000

set bars small

set grid

#set bars small
#set style data lines

set grid x2tics ytics mx2tics

set xtics nomirror

set x2tics nomirror
set mx2tics 2
set x2label 'Energie / \si{\kilo\electronvolt}'
set link x2 via 0.2*x inverse x/0.2

#set style fill solid

load './../gnuplot_linestyles.plt'

plot './data/bodenprobe_bereinigt.txt' using 1:2:3 w boxes t'Messwerte' ls 1

# FIT STARTWERTE

# Amplituden
a = 800

# Mittelwerte
b = 350

#Schwankungsbreiten
c = 20

# Untergrund
d = 100

# FIT

t(x)= a*exp(-0.5*((x-b)/c)**2) + d
fit t(x) './data/bodenprobe_bereinigt.txt' using 1:2:3 yerror via a, b, c, d

g(x) = a*exp(-0.5*((x-b)/c)**2) # Gaußfit
u(x) = d				# Untergrund

load './../gnuplot_linestyles.plt'

plot './data/bodenprobe_bereinigt.txt' using 1:2:3 t'Messwerte' ls 1, \
	t(x) t'$\Sigma$' ls 2 lw 2,\
	g(x) t'$\mathcal{G}_1$' ls 3 lw 2,\
	u(x) t'$d$' ls 5 lw 2

unset output
