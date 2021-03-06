#!/usr/bin/gnuplot
#
# Demonstration of a common use scenario of the multiplot environment.
#
# AUTHOR: Hagen Wierstorf
#

reset

set term epslatex color size 5.7,8.5
set output './plots/referenzspektren1.tex'

unset key

# Enable the use of macros
set macros

set tics scale 1
set yrange [0:*]
set xtics font ',6' 

set grid

# MACROS
# x- and ytics for each row resp. column
NOXTICS = "set xtics autofreq;\
          set xlabel ''"
XTICS = "set xtics autofreq;\
          set xlabel 'Energie $E / \\si{\\kilo\\electronvolt}$'"
NOYTICS = "set format y '%.0f'; unset ylabel"
YTICS = "set format y '%.0f'; set ylabel 'Counts'"
# Placement of the labels in the graphs
POS = "at graph 0.88,0.92 font ',8'"

# Margins for each row resp. column
TMARGIN = "set tmargin at screen 0.95; set bmargin at screen 0.7"
MMARGIN = "set tmargin at screen 0.65; set bmargin at screen 0.4"
BMARGIN = "set tmargin at screen 0.35; set bmargin at screen 0.1"
LMARGIN = "set lmargin at screen 0.1; set rmargin at screen 0.45"
RMARGIN = "set lmargin at screen 0.55; set rmargin at screen 0.9"

### Start multiplot (2x3 layout)
set multiplot layout 3,2 rowsfirst

# --- GRAPH a
set xrange [0:20]
@NOXTICS; @YTICS
@TMARGIN; @LMARGIN
set label 1 'Pb' @POS
plot './messdaten/materialanalyse/referenzspektren/blei.txt' using ((-657.68+67.5264*($1))/1000):2 with lines ls 1

# --- GRAPH b
set xrange [2:11]
set xtics ('2,5' 2.5, 5, '7,5' 7.5, 10)
@NOXTICS; @NOYTICS
@TMARGIN; @RMARGIN
set label 1 'Fe' @POS
plot './messdaten/materialanalyse/referenzspektren/eisen.txt' using ((-657.68+67.5264*($1))/1000):2 with lines ls 1

# --- GRAPH c
set xrange [0:30]
@NOXTICS; @YTICS
@MMARGIN; @LMARGIN
set label 1 'Au' @POS
plot './messdaten/materialanalyse/referenzspektren/gold.txt' using ((-657.68+67.5264*($1))/1000):2 with lines ls 1

# --- GRAPH d
set xrange [0:30]
@NOXTICS; @NOYTICS
@MMARGIN; @RMARGIN
set label 1 'In' @POS
plot './messdaten/materialanalyse/referenzspektren/indium.txt' using ((-657.68+67.5264*($1))/1000):2 with lines ls 1

# --- GRAPH e
set xrange [5:10]
@XTICS; @YTICS
@BMARGIN; @LMARGIN
set label 1 'Cu' @POS
plot './messdaten/materialanalyse/referenzspektren/kupfer.txt' using ((-657.68+67.5264*($1))/1000):2 with lines ls 1

# --- GRAPH f
set xrange [5:10]
@XTICS; @NOYTICS
@BMARGIN; @RMARGIN
set label 1 'Ni' @POS
plot './messdaten/materialanalyse/referenzspektren/nickel.txt' using ((-657.68+67.5264*($1))/1000):2 with lines ls 1

unset multiplot
unset output
set term pop
### End multiplot