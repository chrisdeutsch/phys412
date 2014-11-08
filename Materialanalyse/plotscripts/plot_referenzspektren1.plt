#!/usr/bin/gnuplot
#
# Demonstration of a common use scenario of the multiplot environment.
#
# AUTHOR: Hagen Wierstorf
#

reset

set term epslatex color size 5.7,9.5
set output './plots/referenzspektren1.tex'

unset key

# Enable the use of macros
set macros

set tics scale 1
set xrange [0:*]
set yrange [0:10000]
set grid

# MACROS
# x- and ytics for each row resp. column
NOXTICS = "set xtics (' ' 0, ' ' 100, ' ' 200, ' ' 300, ' ' 400, ' ' 500, ' ' 600); \
          unset xlabel"
XTICS = "set xtics;\
          set xlabel 'x'"
NOYTICS = "set format y ''; unset ylabel"
YTICS = "set format y '%.0f'; set ylabel 'Counts'"
# Placement of the labels in the graphs
POS = "at graph 0.92,0.92 font ',8'"

# Margins for each row resp. column
TMARGIN = "set tmargin at screen 0.95; set bmargin at screen 0.675"
MMARGIN = "set tmargin at screen 0.65; set bmargin at screen 0.375"
BMARGIN = "set tmargin at screen 0.35; set bmargin at screen 0.075"
LMARGIN = "set lmargin at screen 0.1; set rmargin at screen 0.5"
RMARGIN = "set lmargin at screen 0.5; set rmargin at screen 0.9"

### Start multiplot (2x3 layout)
set multiplot layout 3,2 rowsfirst title 'Referenzspektren Teil 1'

# --- GRAPH a
@NOXTICS; @YTICS
@TMARGIN; @LMARGIN
set label 1 'Pb' @POS
plot './messdaten/materialanalyse/referenzspektren/blei.txt' with lines ls 1

# --- GRAPH b
@NOXTICS; @NOYTICS
@TMARGIN; @RMARGIN
set label 1 'Fe' @POS
plot './messdaten/materialanalyse/referenzspektren/eisen.txt' with lines ls 1

# --- GRAPH c
@NOXTICS; @YTICS
@MMARGIN; @LMARGIN
set label 1 'Au' @POS
plot './messdaten/materialanalyse/referenzspektren/gold.txt' with lines ls 1

# --- GRAPH d
@NOXTICS; @NOYTICS
@MMARGIN; @RMARGIN
set label 1 'In' @POS
plot './messdaten/materialanalyse/referenzspektren/indium.txt' with lines ls 1

# --- GRAPH e
@XTICS; @YTICS
@BMARGIN; @LMARGIN
set label 1 'Cu' @POS
plot './messdaten/materialanalyse/referenzspektren/kupfer.txt' with lines ls 1

# --- GRAPH f
@XTICS; @NOYTICS
@BMARGIN; @RMARGIN
set label 1 'Ni' @POS
plot './messdaten/materialanalyse/referenzspektren/nickel.txt' with lines ls 1

unset multiplot
unset output
set term pop
### End multiplot