set terminal png size 600,800
myCartesianXStart=2.5
myCartesianXEnd=2.5
myCartesianYStart=2.5
myCartesianYEnd=2.5
set xzeroaxis
set yzeroaxis
set rmargin 1
set lmargin 3
set tmargin 2
set bmargin 2
set xrange [-myCartesianXStart:myCartesianXEnd]
set yrange [-myCartesianYStart:myCartesianYEnd]
set size square
set key right bottom
set output 'png/file1449750885_0.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750885_0.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:45"
plot "dat/output_LMS_achim_1449750885_0.dat" u 1:2 title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750885_0.dat" u 1:2 title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750885_0_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750885_0_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750885_0_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750886_0.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750886_0.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:46"
plot "dat/output_LMS_achim_1449750886_0.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750886_0.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750886_0_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750886_0_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750886_0_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750886_1.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750886_1.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:46"
plot "dat/output_LMS_achim_1449750886_1.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750886_1.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750886_1_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750886_1_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750886_1_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750886_2.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750886_2.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:46"
plot "dat/output_LMS_achim_1449750886_2.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750886_2.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750886_2_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750886_2_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750886_2_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750886_3.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750886_3.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:46"
plot "dat/output_LMS_achim_1449750886_3.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750886_3.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750886_3_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750886_3_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750886_3_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750886_4.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750886_4.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:46"
plot "dat/output_LMS_achim_1449750886_4.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750886_4.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750886_4_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750886_4_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750886_4_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750886_5.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750886_5.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:46"
plot "dat/output_LMS_achim_1449750886_5.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750886_5.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750886_5_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750886_5_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750886_5_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750886_6.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750886_6.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:46"
plot "dat/output_LMS_achim_1449750886_6.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750886_6.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750886_6_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750886_6_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750886_6_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750886_7.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750886_7.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:46"
plot "dat/output_LMS_achim_1449750886_7.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750886_7.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750886_7_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750886_7_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750886_7_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750886_8.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750886_8.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:46"
plot "dat/output_LMS_achim_1449750886_8.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750886_8.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750886_8_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750886_8_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750886_8_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750886_9.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750886_9.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:46"
plot "dat/output_LMS_achim_1449750886_9.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750886_9.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750886_9_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750886_9_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750886_9_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750887_0.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750887_0.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:47"
plot "dat/output_LMS_achim_1449750887_0.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750887_0.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750887_0_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750887_0_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750887_0_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750887_1.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750887_1.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:47"
plot "dat/output_LMS_achim_1449750887_1.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750887_1.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750887_1_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750887_1_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750887_1_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750887_2.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750887_2.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:47"
plot "dat/output_LMS_achim_1449750887_2.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750887_2.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750887_2_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750887_2_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750887_2_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750887_3.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750887_3.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:47"
plot "dat/output_LMS_achim_1449750887_3.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750887_3.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750887_3_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750887_3_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750887_3_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750887_4.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750887_4.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:47"
plot "dat/output_LMS_achim_1449750887_4.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750887_4.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750887_4_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750887_4_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750887_4_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750887_5.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750887_5.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:47"
plot "dat/output_LMS_achim_1449750887_5.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750887_5.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750887_5_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750887_5_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750887_5_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750887_6.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750887_6.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:47"
plot "dat/output_LMS_achim_1449750887_6.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750887_6.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750887_6_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750887_6_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750887_6_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750887_7.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750887_7.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:47"
plot "dat/output_LMS_achim_1449750887_7.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750887_7.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750887_7_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750887_7_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750887_7_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750887_8.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750887_8.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:47"
plot "dat/output_LMS_achim_1449750887_8.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750887_8.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750887_8_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750887_8_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750887_8_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750887_9.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750887_9.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:47"
plot "dat/output_LMS_achim_1449750887_9.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750887_9.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750887_9_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750887_9_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750887_9_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750888_0.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750888_0.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:48"
plot "dat/output_LMS_achim_1449750888_0.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750888_0.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750888_0_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750888_0_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750888_0_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750888_1.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750888_1.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:48"
plot "dat/output_LMS_achim_1449750888_1.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750888_1.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750888_1_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750888_1_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750888_1_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750888_2.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750888_2.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:48"
plot "dat/output_LMS_achim_1449750888_2.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750888_2.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750888_2_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750888_2_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750888_2_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750888_3.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750888_3.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:48"
plot "dat/output_LMS_achim_1449750888_3.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750888_3.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750888_3_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750888_3_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750888_3_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750888_4.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750888_4.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:48"
plot "dat/output_LMS_achim_1449750888_4.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750888_4.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750888_4_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750888_4_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750888_4_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750888_5.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750888_5.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:48"
plot "dat/output_LMS_achim_1449750888_5.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750888_5.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750888_5_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750888_5_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750888_5_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750888_6.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750888_6.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:48"
plot "dat/output_LMS_achim_1449750888_6.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750888_6.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750888_6_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750888_6_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750888_6_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750888_7.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750888_7.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:48"
plot "dat/output_LMS_achim_1449750888_7.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750888_7.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750888_7_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750888_7_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750888_7_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750888_8.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750888_8.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:48"
plot "dat/output_LMS_achim_1449750888_8.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750888_8.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750888_8_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750888_8_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750888_8_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750888_9.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750888_9.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:48"
plot "dat/output_LMS_achim_1449750888_9.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750888_9.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750888_9_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750888_9_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750888_9_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750889_0.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750889_0.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:49"
plot "dat/output_LMS_achim_1449750889_0.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750889_0.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750889_0_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750889_0_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750889_0_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750889_1.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750889_1.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:49"
plot "dat/output_LMS_achim_1449750889_1.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750889_1.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750889_1_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750889_1_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750889_1_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750889_2.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750889_2.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:49"
plot "dat/output_LMS_achim_1449750889_2.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750889_2.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750889_2_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750889_2_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750889_2_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750889_3.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750889_3.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:49"
plot "dat/output_LMS_achim_1449750889_3.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750889_3.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750889_3_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750889_3_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750889_3_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750889_4.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750889_4.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:49"
plot "dat/output_LMS_achim_1449750889_4.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750889_4.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750889_4_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750889_4_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750889_4_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750889_5.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750889_5.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:49"
plot "dat/output_LMS_achim_1449750889_5.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750889_5.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750889_5_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750889_5_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750889_5_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750889_6.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750889_6.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:49"
plot "dat/output_LMS_achim_1449750889_6.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750889_6.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750889_6_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750889_6_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750889_6_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750889_7.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750889_7.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:49"
plot "dat/output_LMS_achim_1449750889_7.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750889_7.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750889_7_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750889_7_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750889_7_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750889_8.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750889_8.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:49"
plot "dat/output_LMS_achim_1449750889_8.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750889_8.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750889_8_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750889_8_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750889_8_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750889_9.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750889_9.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:49"
plot "dat/output_LMS_achim_1449750889_9.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750889_9.dat" u 1:2 title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750889_9_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750889_9_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750889_9_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750890_0.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750890_0.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:50"
plot "dat/output_LMS_achim_1449750890_0.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750890_0.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750890_0_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750890_0_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750890_0_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750890_1.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750890_1.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:50"
plot "dat/output_LMS_achim_1449750890_1.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750890_1.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750890_1_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750890_1_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750890_1_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750890_2.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750890_2.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:50"
plot "dat/output_LMS_achim_1449750890_2.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750890_2.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750890_2_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750890_2_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750890_2_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750890_3.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750890_3.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:50"
plot "dat/output_LMS_achim_1449750890_3.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750890_3.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750890_3_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750890_3_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750890_3_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750890_4.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750890_4.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:50"
plot "dat/output_LMS_achim_1449750890_4.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750890_4.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750890_4_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750890_4_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750890_4_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750890_5.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750890_5.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:50"
plot "dat/output_LMS_achim_1449750890_5.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750890_5.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750890_5_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750890_5_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750890_5_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750890_6.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750890_6.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:50"
plot "dat/output_LMS_achim_1449750890_6.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750890_6.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750890_6_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750890_6_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750890_6_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750890_7.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750890_7.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:50"
plot "dat/output_LMS_achim_1449750890_7.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750890_7.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750890_7_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750890_7_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750890_7_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750890_8.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750890_8.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:50"
plot "dat/output_LMS_achim_1449750890_8.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750890_8.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750890_8_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750890_8_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750890_8_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750890_9.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750890_9.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:50"
plot "dat/output_LMS_achim_1449750890_9.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750890_9.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750890_9_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750890_9_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750890_9_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750891_0.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750891_0.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:51"
plot "dat/output_LMS_achim_1449750891_0.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750891_0.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750891_0_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750891_0_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750891_0_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750891_1.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750891_1.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:51"
plot "dat/output_LMS_achim_1449750891_1.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750891_1.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750891_1_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750891_1_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750891_1_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750891_2.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750891_2.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:51"
plot "dat/output_LMS_achim_1449750891_2.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750891_2.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750891_2_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750891_2_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750891_2_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750891_3.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750891_3.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:51"
plot "dat/output_LMS_achim_1449750891_3.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750891_3.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750891_3_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750891_3_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750891_3_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750891_4.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750891_4.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:51"
plot "dat/output_LMS_achim_1449750891_4.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750891_4.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750891_4_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750891_4_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750891_4_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750891_5.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750891_5.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:51"
plot "dat/output_LMS_achim_1449750891_5.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750891_5.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750891_5_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750891_5_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750891_5_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750891_6.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750891_6.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:51"
plot "dat/output_LMS_achim_1449750891_6.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750891_6.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750891_6_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750891_6_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750891_6_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750891_7.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750891_7.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:51"
plot "dat/output_LMS_achim_1449750891_7.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750891_7.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750891_7_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750891_7_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750891_7_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750891_8.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750891_8.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:51"
plot "dat/output_LMS_achim_1449750891_8.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750891_8.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750891_8_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750891_8_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750891_8_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750891_9.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750891_9.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:51"
plot "dat/output_LMS_achim_1449750891_9.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750891_9.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750891_9_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750891_9_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750891_9_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750892_0.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750892_0.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:52"
plot "dat/output_LMS_achim_1449750892_0.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750892_0.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750892_0_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750892_0_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750892_0_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750892_1.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750892_1.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:52"
plot "dat/output_LMS_achim_1449750892_1.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750892_1.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750892_1_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750892_1_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750892_1_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750892_2.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750892_2.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:52"
plot "dat/output_LMS_achim_1449750892_2.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750892_2.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750892_2_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750892_2_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750892_2_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750892_3.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750892_3.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:52"
plot "dat/output_LMS_achim_1449750892_3.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750892_3.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750892_3_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750892_3_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750892_3_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750892_4.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750892_4.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:52"
plot "dat/output_LMS_achim_1449750892_4.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750892_4.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750892_4_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750892_4_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750892_4_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750892_5.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750892_5.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:52"
plot "dat/output_LMS_achim_1449750892_5.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750892_5.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750892_5_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750892_5_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750892_5_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750892_6.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750892_6.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:52"
plot "dat/output_LMS_achim_1449750892_6.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750892_6.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750892_6_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750892_6_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750892_6_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750892_7.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750892_7.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:52"
plot "dat/output_LMS_achim_1449750892_7.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750892_7.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750892_7_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750892_7_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750892_7_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750892_8.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750892_8.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:52"
plot "dat/output_LMS_achim_1449750892_8.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750892_8.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750892_8_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750892_8_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750892_8_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750892_9.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750892_9.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:52"
plot "dat/output_LMS_achim_1449750892_9.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750892_9.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750892_9_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750892_9_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750892_9_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750893_0.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750893_0.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:53"
plot "dat/output_LMS_achim_1449750893_0.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750893_0.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750893_0_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750893_0_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750893_0_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750893_1.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750893_1.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:53"
plot "dat/output_LMS_achim_1449750893_1.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750893_1.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750893_1_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750893_1_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750893_1_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750893_2.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750893_2.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:53"
plot "dat/output_LMS_achim_1449750893_2.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750893_2.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750893_2_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750893_2_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750893_2_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750893_3.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750893_3.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:53"
plot "dat/output_LMS_achim_1449750893_3.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750893_3.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750893_3_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750893_3_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750893_3_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750893_4.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750893_4.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:53"
plot "dat/output_LMS_achim_1449750893_4.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750893_4.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750893_4_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750893_4_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750893_4_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750893_5.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750893_5.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:53"
plot "dat/output_LMS_achim_1449750893_5.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750893_5.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750893_5_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750893_5_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750893_5_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750893_6.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750893_6.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:53"
plot "dat/output_LMS_achim_1449750893_6.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750893_6.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750893_6_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750893_6_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750893_6_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750893_7.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750893_7.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:53"
plot "dat/output_LMS_achim_1449750893_7.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750893_7.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750893_7_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750893_7_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750893_7_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750893_8.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750893_8.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:53"
plot "dat/output_LMS_achim_1449750893_8.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750893_8.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750893_8_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750893_8_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750893_8_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750893_9.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750893_9.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:53"
plot "dat/output_LMS_achim_1449750893_9.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750893_9.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750893_9_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750893_9_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750893_9_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750894_0.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750894_0.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:54"
plot "dat/output_LMS_achim_1449750894_0.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750894_0.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750894_0_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750894_0_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750894_0_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750894_1.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750894_1.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:54"
plot "dat/output_LMS_achim_1449750894_1.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750894_1.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750894_1_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750894_1_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750894_1_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750894_2.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750894_2.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:54"
plot "dat/output_LMS_achim_1449750894_2.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750894_2.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750894_2_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750894_2_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750894_2_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750894_3.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750894_3.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:54"
plot "dat/output_LMS_achim_1449750894_3.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750894_3.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750894_3_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750894_3_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750894_3_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750894_4.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750894_4.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:54"
plot "dat/output_LMS_achim_1449750894_4.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750894_4.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750894_4_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750894_4_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750894_4_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750894_5.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750894_5.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:54"
plot "dat/output_LMS_achim_1449750894_5.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750894_5.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750894_5_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750894_5_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750894_5_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750894_6.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750894_6.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:54"
plot "dat/output_LMS_achim_1449750894_6.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750894_6.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750894_6_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750894_6_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750894_6_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750894_7.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750894_7.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:54"
plot "dat/output_LMS_achim_1449750894_7.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750894_7.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750894_7_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750894_7_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750894_7_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750894_8.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750894_8.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:54"
plot "dat/output_LMS_achim_1449750894_8.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750894_8.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750894_8_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750894_8_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750894_8_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750894_9.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750894_9.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:54"
plot "dat/output_LMS_achim_1449750894_9.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750894_9.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750894_9_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750894_9_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750894_9_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750895_0.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750895_0.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:55"
plot "dat/output_LMS_achim_1449750895_0.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750895_0.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750895_0_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750895_0_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750895_0_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750895_1.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750895_1.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:55"
plot "dat/output_LMS_achim_1449750895_1.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750895_1.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750895_1_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750895_1_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750895_1_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750895_2.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750895_2.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:55"
plot "dat/output_LMS_achim_1449750895_2.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750895_2.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750895_2_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750895_2_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750895_2_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750895_3.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750895_3.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:55"
plot "dat/output_LMS_achim_1449750895_3.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750895_3.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750895_3_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750895_3_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750895_3_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750895_4.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750895_4.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:55"
plot "dat/output_LMS_achim_1449750895_4.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750895_4.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750895_4_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750895_4_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750895_4_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750895_5.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750895_5.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:55"
plot "dat/output_LMS_achim_1449750895_5.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750895_5.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750895_5_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750895_5_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750895_5_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750895_6.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750895_6.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:55"
plot "dat/output_LMS_achim_1449750895_6.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750895_6.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750895_6_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750895_6_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750895_6_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750895_7.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750895_7.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:55"
plot "dat/output_LMS_achim_1449750895_7.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750895_7.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750895_7_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750895_7_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750895_7_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750895_8.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750895_8.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:55"
plot "dat/output_LMS_achim_1449750895_8.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750895_8.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750895_8_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750895_8_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750895_8_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750895_9.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750895_9.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:55"
plot "dat/output_LMS_achim_1449750895_9.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750895_9.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750895_9_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750895_9_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750895_9_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750896_0.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750896_0.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:56"
plot "dat/output_LMS_achim_1449750896_0.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750896_0.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750896_0_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750896_0_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750896_0_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750896_1.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750896_1.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:56"
plot "dat/output_LMS_achim_1449750896_1.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750896_1.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750896_1_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750896_1_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750896_1_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750896_2.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750896_2.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:56"
plot "dat/output_LMS_achim_1449750896_2.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750896_2.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750896_2_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750896_2_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750896_2_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750896_3.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750896_3.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:56"
plot "dat/output_LMS_achim_1449750896_3.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750896_3.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750896_3_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750896_3_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750896_3_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750896_4.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750896_4.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:56"
plot "dat/output_LMS_achim_1449750896_4.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750896_4.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750896_4_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750896_4_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750896_4_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750896_5.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750896_5.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:56"
plot "dat/output_LMS_achim_1449750896_5.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750896_5.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750896_5_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750896_5_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750896_5_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750896_6.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750896_6.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:56"
plot "dat/output_LMS_achim_1449750896_6.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750896_6.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750896_6_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750896_6_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750896_6_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750896_7.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750896_7.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:56"
plot "dat/output_LMS_achim_1449750896_7.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750896_7.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750896_7_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750896_7_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750896_7_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750896_8.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750896_8.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:56"
plot "dat/output_LMS_achim_1449750896_8.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750896_8.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750896_8_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750896_8_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750896_8_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750896_9.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750896_9.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:56"
plot "dat/output_LMS_achim_1449750896_9.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750896_9.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750896_9_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750896_9_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750896_9_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750897_0.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750897_0.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:57"
plot "dat/output_LMS_achim_1449750897_0.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750897_0.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750897_0_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750897_0_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750897_0_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750897_1.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750897_1.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:57"
plot "dat/output_LMS_achim_1449750897_1.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750897_1.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750897_1_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750897_1_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750897_1_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750897_2.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750897_2.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:57"
plot "dat/output_LMS_achim_1449750897_2.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750897_2.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750897_2_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750897_2_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750897_2_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750897_3.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750897_3.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:57"
plot "dat/output_LMS_achim_1449750897_3.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750897_3.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750897_3_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750897_3_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750897_3_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750897_4.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750897_4.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:57"
plot "dat/output_LMS_achim_1449750897_4.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750897_4.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750897_4_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750897_4_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750897_4_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750897_5.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750897_5.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:57"
plot "dat/output_LMS_achim_1449750897_5.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750897_5.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750897_5_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750897_5_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750897_5_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750897_6.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750897_6.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:57"
plot "dat/output_LMS_achim_1449750897_6.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750897_6.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750897_6_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750897_6_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750897_6_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750897_7.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750897_7.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:57"
plot "dat/output_LMS_achim_1449750897_7.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750897_7.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750897_7_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750897_7_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750897_7_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750897_8.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750897_8.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:57"
plot "dat/output_LMS_achim_1449750897_8.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750897_8.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750897_8_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750897_8_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750897_8_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750897_9.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750897_9.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:57"
plot "dat/output_LMS_achim_1449750897_9.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750897_9.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750897_9_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750897_9_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750897_9_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750898_0.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750898_0.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:58"
plot "dat/output_LMS_achim_1449750898_0.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750898_0.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750898_0_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750898_0_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750898_0_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750898_1.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750898_1.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:58"
plot "dat/output_LMS_achim_1449750898_1.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750898_1.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750898_1_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750898_1_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750898_1_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750898_2.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750898_2.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:58"
plot "dat/output_LMS_achim_1449750898_2.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750898_2.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750898_2_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750898_2_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750898_2_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750898_3.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750898_3.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:58"
plot "dat/output_LMS_achim_1449750898_3.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750898_3.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750898_3_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750898_3_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750898_3_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750898_4.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750898_4.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:58"
plot "dat/output_LMS_achim_1449750898_4.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750898_4.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750898_4_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750898_4_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750898_4_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750898_5.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750898_5.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:58"
plot "dat/output_LMS_achim_1449750898_5.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750898_5.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750898_5_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750898_5_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750898_5_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750898_6.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750898_6.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:58"
plot "dat/output_LMS_achim_1449750898_6.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750898_6.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750898_6_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750898_6_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750898_6_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750898_7.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750898_7.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:58"
plot "dat/output_LMS_achim_1449750898_7.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750898_7.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750898_7_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750898_7_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750898_7_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750898_8.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750898_8.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:58"
plot "dat/output_LMS_achim_1449750898_8.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750898_8.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750898_8_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750898_8_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750898_8_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750898_9.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750898_9.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:58"
plot "dat/output_LMS_achim_1449750898_9.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750898_9.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750898_9_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750898_9_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750898_9_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750899_0.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750899_0.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:59"
plot "dat/output_LMS_achim_1449750899_0.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750899_0.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750899_0_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750899_0_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750899_0_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750899_1.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750899_1.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:59"
plot "dat/output_LMS_achim_1449750899_1.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750899_1.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750899_1_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750899_1_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750899_1_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750899_2.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750899_2.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:59"
plot "dat/output_LMS_achim_1449750899_2.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750899_2.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750899_2_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750899_2_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750899_2_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750899_3.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750899_3.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:59"
plot "dat/output_LMS_achim_1449750899_3.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750899_3.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750899_3_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750899_3_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750899_3_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750899_4.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750899_4.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:59"
plot "dat/output_LMS_achim_1449750899_4.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750899_4.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750899_4_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750899_4_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750899_4_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750899_5.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750899_5.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:59"
plot "dat/output_LMS_achim_1449750899_5.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750899_5.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750899_5_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750899_5_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750899_5_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750899_6.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750899_6.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:59"
plot "dat/output_LMS_achim_1449750899_6.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750899_6.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750899_6_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750899_6_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750899_6_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750899_7.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750899_7.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:59"
plot "dat/output_LMS_achim_1449750899_7.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750899_7.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750899_7_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750899_7_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750899_7_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750899_8.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750899_8.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:59"
plot "dat/output_LMS_achim_1449750899_8.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750899_8.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750899_8_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750899_8_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750899_8_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750899_9.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750899_9.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:34:59"
plot "dat/output_LMS_achim_1449750899_9.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750899_9.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750899_9_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750899_9_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750899_9_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750900_0.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750900_0.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:00"
plot "dat/output_LMS_achim_1449750900_0.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750900_0.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750900_0_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750900_0_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750900_0_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750900_1.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750900_1.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:00"
plot "dat/output_LMS_achim_1449750900_1.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750900_1.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750900_1_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750900_1_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750900_1_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750900_2.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750900_2.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:00"
plot "dat/output_LMS_achim_1449750900_2.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750900_2.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750900_2_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750900_2_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750900_2_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750900_3.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750900_3.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:00"
plot "dat/output_LMS_achim_1449750900_3.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750900_3.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750900_3_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750900_3_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750900_3_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750900_4.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750900_4.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:00"
plot "dat/output_LMS_achim_1449750900_4.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750900_4.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750900_4_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750900_4_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750900_4_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750900_5.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750900_5.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:00"
plot "dat/output_LMS_achim_1449750900_5.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750900_5.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750900_5_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750900_5_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750900_5_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750900_6.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750900_6.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:00"
plot "dat/output_LMS_achim_1449750900_6.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750900_6.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750900_6_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750900_6_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750900_6_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750900_7.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750900_7.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:00"
plot "dat/output_LMS_achim_1449750900_7.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750900_7.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750900_7_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750900_7_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750900_7_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750900_8.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750900_8.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:00"
plot "dat/output_LMS_achim_1449750900_8.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750900_8.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750900_8_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750900_8_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750900_8_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750900_9.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750900_9.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:00"
plot "dat/output_LMS_achim_1449750900_9.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750900_9.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750900_9_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750900_9_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750900_9_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750901_0.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750901_0.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:01"
plot "dat/output_LMS_achim_1449750901_0.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750901_0.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750901_0_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750901_0_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750901_0_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750901_1.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750901_1.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:01"
plot "dat/output_LMS_achim_1449750901_1.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750901_1.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750901_1_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750901_1_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750901_1_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750901_2.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750901_2.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:01"
plot "dat/output_LMS_achim_1449750901_2.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750901_2.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750901_2_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750901_2_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750901_2_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750901_3.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750901_3.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:01"
plot "dat/output_LMS_achim_1449750901_3.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750901_3.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750901_3_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750901_3_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750901_3_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750901_4.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750901_4.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:01"
plot "dat/output_LMS_achim_1449750901_4.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750901_4.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750901_4_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750901_4_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750901_4_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750901_5.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750901_5.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:01"
plot "dat/output_LMS_achim_1449750901_5.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750901_5.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750901_5_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750901_5_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750901_5_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750901_6.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750901_6.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:01"
plot "dat/output_LMS_achim_1449750901_6.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750901_6.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750901_6_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750901_6_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750901_6_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750901_7.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750901_7.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:01"
plot "dat/output_LMS_achim_1449750901_7.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750901_7.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750901_7_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750901_7_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750901_7_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750901_8.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750901_8.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:01"
plot "dat/output_LMS_achim_1449750901_8.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750901_8.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750901_8_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750901_8_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750901_8_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750901_9.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750901_9.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:01"
plot "dat/output_LMS_achim_1449750901_9.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750901_9.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750901_9_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750901_9_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750901_9_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750902_0.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750902_0.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:02"
plot "dat/output_LMS_achim_1449750902_0.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750902_0.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750902_0_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750902_0_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750902_0_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750902_1.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750902_1.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:02"
plot "dat/output_LMS_achim_1449750902_1.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750902_1.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750902_1_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750902_1_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750902_1_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750902_2.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750902_2.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:02"
plot "dat/output_LMS_achim_1449750902_2.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750902_2.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750902_2_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750902_2_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750902_2_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750902_3.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750902_3.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:02"
plot "dat/output_LMS_achim_1449750902_3.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750902_3.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750902_3_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750902_3_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750902_3_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750902_4.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750902_4.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:02"
plot "dat/output_LMS_achim_1449750902_4.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750902_4.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750902_4_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750902_4_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750902_4_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750902_5.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750902_5.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:02"
plot "dat/output_LMS_achim_1449750902_5.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750902_5.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750902_5_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750902_5_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750902_5_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750902_6.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750902_6.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:02"
plot "dat/output_LMS_achim_1449750902_6.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750902_6.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750902_6_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750902_6_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750902_6_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750902_7.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750902_7.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:02"
plot "dat/output_LMS_achim_1449750902_7.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750902_7.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750902_7_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750902_7_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750902_7_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750902_8.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750902_8.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:02"
plot "dat/output_LMS_achim_1449750902_8.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750902_8.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750902_8_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750902_8_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750902_8_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750902_9.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750902_9.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:02"
plot "dat/output_LMS_achim_1449750902_9.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750902_9.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750902_9_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750902_9_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750902_9_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750903_0.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750903_0.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:03"
plot "dat/output_LMS_achim_1449750903_0.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750903_0.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750903_0_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750903_0_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750903_0_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750903_1.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750903_1.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:03"
plot "dat/output_LMS_achim_1449750903_1.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750903_1.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750903_1_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750903_1_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750903_1_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750903_2.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750903_2.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:03"
plot "dat/output_LMS_achim_1449750903_2.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750903_2.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750903_2_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750903_2_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750903_2_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750903_3.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750903_3.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:03"
plot "dat/output_LMS_achim_1449750903_3.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750903_3.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750903_3_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750903_3_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750903_3_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750903_4.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750903_4.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:03"
plot "dat/output_LMS_achim_1449750903_4.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750903_4.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750903_4_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750903_4_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750903_4_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750903_5.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750903_5.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:03"
plot "dat/output_LMS_achim_1449750903_5.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750903_5.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750903_5_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750903_5_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750903_5_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750903_6.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750903_6.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:03"
plot "dat/output_LMS_achim_1449750903_6.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750903_6.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750903_6_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750903_6_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750903_6_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750903_7.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750903_7.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:03"
plot "dat/output_LMS_achim_1449750903_7.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750903_7.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750903_7_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750903_7_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750903_7_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750903_8.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750903_8.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:03"
plot "dat/output_LMS_achim_1449750903_8.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750903_8.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750903_8_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750903_8_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750903_8_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750903_9.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750903_9.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:03"
plot "dat/output_LMS_achim_1449750903_9.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750903_9.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750903_9_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750903_9_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750903_9_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750904_0.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750904_0.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:04"
plot "dat/output_LMS_achim_1449750904_0.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750904_0.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750904_0_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750904_0_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750904_0_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750904_1.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750904_1.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:04"
plot "dat/output_LMS_achim_1449750904_1.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750904_1.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750904_1_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750904_1_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750904_1_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750904_2.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750904_2.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:04"
plot "dat/output_LMS_achim_1449750904_2.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750904_2.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750904_2_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750904_2_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750904_2_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750904_3.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750904_3.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:04"
plot "dat/output_LMS_achim_1449750904_3.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750904_3.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750904_3_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750904_3_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750904_3_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750904_4.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750904_4.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:04"
plot "dat/output_LMS_achim_1449750904_4.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750904_4.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750904_4_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750904_4_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750904_4_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750904_5.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750904_5.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:04"
plot "dat/output_LMS_achim_1449750904_5.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750904_5.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750904_5_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750904_5_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750904_5_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750904_6.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750904_6.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:04"
plot "dat/output_LMS_achim_1449750904_6.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750904_6.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750904_6_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750904_6_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750904_6_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750904_7.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750904_7.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:04"
plot "dat/output_LMS_achim_1449750904_7.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750904_7.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750904_7_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750904_7_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750904_7_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750904_8.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750904_8.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:04"
plot "dat/output_LMS_achim_1449750904_8.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750904_8.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750904_8_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750904_8_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750904_8_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750904_9.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750904_9.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:04"
plot "dat/output_LMS_achim_1449750904_9.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750904_9.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750904_9_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750904_9_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750904_9_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750905_0.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750905_0.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:05"
plot "dat/output_LMS_achim_1449750905_0.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750905_0.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750905_0_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750905_0_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750905_0_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750905_1.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750905_1.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:05"
plot "dat/output_LMS_achim_1449750905_1.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750905_1.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750905_1_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750905_1_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750905_1_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750905_2.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750905_2.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:05"
plot "dat/output_LMS_achim_1449750905_2.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750905_2.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750905_2_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750905_2_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750905_2_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750905_3.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750905_3.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:05"
plot "dat/output_LMS_achim_1449750905_3.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750905_3.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750905_3_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750905_3_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750905_3_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750905_4.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750905_4.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:05"
plot "dat/output_LMS_achim_1449750905_4.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750905_4.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750905_4_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750905_4_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750905_4_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750905_5.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750905_5.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:05"
plot "dat/output_LMS_achim_1449750905_5.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750905_5.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750905_5_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750905_5_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750905_5_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750905_6.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750905_6.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:05"
plot "dat/output_LMS_achim_1449750905_6.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750905_6.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750905_6_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750905_6_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750905_6_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750905_7.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750905_7.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:05"
plot "dat/output_LMS_achim_1449750905_7.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750905_7.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750905_7_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750905_7_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750905_7_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750905_8.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750905_8.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:05"
plot "dat/output_LMS_achim_1449750905_8.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750905_8.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750905_8_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750905_8_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750905_8_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750905_9.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750905_9.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:05"
plot "dat/output_LMS_achim_1449750905_9.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750905_9.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750905_9_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750905_9_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750905_9_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750906_0.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750906_0.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:06"
plot "dat/output_LMS_achim_1449750906_0.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750906_0.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750906_0_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750906_0_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750906_0_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750906_1.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750906_1.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:06"
plot "dat/output_LMS_achim_1449750906_1.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750906_1.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750906_1_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750906_1_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750906_1_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750906_2.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750906_2.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:06"
plot "dat/output_LMS_achim_1449750906_2.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750906_2.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750906_2_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750906_2_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750906_2_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750906_3.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750906_3.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:06"
plot "dat/output_LMS_achim_1449750906_3.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750906_3.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750906_3_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750906_3_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750906_3_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750906_4.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750906_4.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:06"
plot "dat/output_LMS_achim_1449750906_4.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750906_4.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750906_4_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750906_4_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750906_4_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750906_5.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750906_5.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:06"
plot "dat/output_LMS_achim_1449750906_5.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750906_5.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750906_5_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750906_5_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750906_5_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750906_6.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750906_6.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:06"
plot "dat/output_LMS_achim_1449750906_6.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750906_6.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750906_6_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750906_6_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750906_6_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750906_7.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750906_7.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:06"
plot "dat/output_LMS_achim_1449750906_7.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750906_7.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750906_7_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750906_7_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750906_7_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750906_8.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750906_8.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:06"
plot "dat/output_LMS_achim_1449750906_8.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750906_8.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750906_8_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750906_8_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750906_8_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750906_9.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750906_9.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:06"
plot "dat/output_LMS_achim_1449750906_9.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750906_9.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750906_9_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750906_9_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750906_9_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750907_0.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750907_0.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:07"
plot "dat/output_LMS_achim_1449750907_0.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750907_0.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750907_0_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750907_0_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750907_0_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750907_1.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750907_1.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:07"
plot "dat/output_LMS_achim_1449750907_1.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750907_1.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750907_1_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750907_1_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750907_1_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750907_2.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750907_2.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:07"
plot "dat/output_LMS_achim_1449750907_2.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750907_2.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750907_2_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750907_2_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750907_2_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750907_3.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750907_3.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:07"
plot "dat/output_LMS_achim_1449750907_3.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750907_3.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750907_3_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750907_3_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750907_3_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750907_4.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750907_4.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:07"
plot "dat/output_LMS_achim_1449750907_4.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750907_4.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750907_4_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750907_4_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750907_4_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750907_5.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750907_5.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:07"
plot "dat/output_LMS_achim_1449750907_5.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750907_5.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750907_5_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750907_5_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750907_5_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750907_6.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750907_6.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:07"
plot "dat/output_LMS_achim_1449750907_6.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750907_6.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750907_6_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750907_6_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750907_6_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750907_7.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750907_7.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:07"
plot "dat/output_LMS_achim_1449750907_7.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750907_7.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750907_7_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750907_7_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750907_7_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750907_8.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750907_8.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:07"
plot "dat/output_LMS_achim_1449750907_8.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750907_8.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750907_8_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750907_8_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750907_8_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750907_9.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750907_9.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:07"
plot "dat/output_LMS_achim_1449750907_9.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750907_9.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750907_9_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750907_9_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750907_9_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750908_0.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750908_0.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:08"
plot "dat/output_LMS_achim_1449750908_0.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750908_0.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750908_0_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750908_0_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750908_0_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750908_1.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750908_1.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:08"
plot "dat/output_LMS_achim_1449750908_1.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750908_1.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750908_1_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750908_1_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750908_1_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750908_2.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750908_2.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:08"
plot "dat/output_LMS_achim_1449750908_2.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750908_2.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750908_2_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750908_2_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750908_2_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750908_3.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750908_3.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:08"
plot "dat/output_LMS_achim_1449750908_3.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750908_3.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750908_3_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750908_3_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750908_3_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750908_4.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750908_4.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:08"
plot "dat/output_LMS_achim_1449750908_4.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750908_4.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750908_4_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750908_4_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750908_4_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750908_5.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750908_5.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:08"
plot "dat/output_LMS_achim_1449750908_5.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750908_5.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750908_5_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750908_5_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750908_5_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750908_6.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750908_6.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:08"
plot "dat/output_LMS_achim_1449750908_6.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750908_6.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750908_6_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750908_6_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750908_6_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750908_7.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750908_7.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:08"
plot "dat/output_LMS_achim_1449750908_7.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750908_7.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750908_7_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750908_7_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750908_7_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750908_8.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750908_8.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:08"
plot "dat/output_LMS_achim_1449750908_8.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750908_8.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750908_8_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750908_8_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750908_8_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750908_9.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750908_9.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:08"
plot "dat/output_LMS_achim_1449750908_9.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750908_9.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750908_9_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750908_9_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750908_9_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750909_0.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750909_0.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:09"
plot "dat/output_LMS_achim_1449750909_0.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750909_0.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750909_0_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750909_0_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750909_0_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750909_1.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750909_1.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:09"
plot "dat/output_LMS_achim_1449750909_1.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750909_1.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750909_1_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750909_1_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750909_1_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750909_2.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750909_2.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:09"
plot "dat/output_LMS_achim_1449750909_2.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750909_2.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750909_2_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750909_2_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750909_2_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750909_3.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750909_3.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:09"
plot "dat/output_LMS_achim_1449750909_3.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750909_3.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750909_3_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750909_3_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750909_3_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750909_4.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750909_4.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:09"
plot "dat/output_LMS_achim_1449750909_4.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750909_4.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750909_4_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750909_4_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750909_4_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750909_5.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750909_5.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:09"
plot "dat/output_LMS_achim_1449750909_5.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750909_5.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750909_5_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750909_5_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750909_5_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750909_6.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750909_6.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:09"
plot "dat/output_LMS_achim_1449750909_6.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750909_6.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750909_6_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750909_6_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750909_6_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750909_7.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750909_7.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:09"
plot "dat/output_LMS_achim_1449750909_7.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750909_7.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750909_7_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750909_7_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750909_7_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750909_8.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750909_8.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:09"
plot "dat/output_LMS_achim_1449750909_8.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750909_8.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750909_8_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750909_8_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750909_8_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750909_9.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750909_9.dat" u 1:2 title "irma"
set title "2015-12-10 13:35:09"
plot "dat/output_LMS_achim_1449750909_9.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750909_9.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750909_9_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750909_9_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750909_9_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750910_0.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750910_0.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:10"
plot "dat/output_LMS_achim_1449750910_0.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750910_0.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750910_0_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750910_0_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750910_0_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750910_1.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750910_1.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:10"
plot "dat/output_LMS_achim_1449750910_1.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750910_1.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750910_1_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750910_1_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750910_1_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750910_2.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750910_2.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:10"
plot "dat/output_LMS_achim_1449750910_2.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750910_2.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750910_2_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750910_2_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750910_2_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750910_3.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750910_3.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:10"
plot "dat/output_LMS_achim_1449750910_3.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750910_3.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750910_3_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750910_3_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750910_3_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750910_4.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750910_4.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:10"
plot "dat/output_LMS_achim_1449750910_4.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750910_4.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750910_4_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750910_4_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750910_4_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750910_5.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750910_5.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:10"
plot "dat/output_LMS_achim_1449750910_5.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750910_5.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750910_5_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750910_5_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750910_5_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750910_6.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750910_6.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:10"
plot "dat/output_LMS_achim_1449750910_6.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750910_6.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750910_6_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750910_6_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750910_6_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750910_7.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750910_7.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:10"
plot "dat/output_LMS_achim_1449750910_7.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750910_7.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750910_7_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750910_7_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750910_7_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750910_8.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750910_8.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:10"
plot "dat/output_LMS_achim_1449750910_8.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750910_8.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750910_8_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750910_8_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750910_8_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750910_9.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750910_9.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:10"
plot "dat/output_LMS_achim_1449750910_9.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750910_9.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750910_9_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750910_9_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750910_9_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750911_0.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750911_0.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:11"
plot "dat/output_LMS_achim_1449750911_0.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750911_0.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750911_0_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750911_0_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750911_0_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750911_1.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750911_1.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:11"
plot "dat/output_LMS_achim_1449750911_1.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750911_1.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750911_1_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750911_1_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750911_1_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750911_2.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750911_2.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:11"
plot "dat/output_LMS_achim_1449750911_2.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750911_2.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750911_2_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750911_2_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750911_2_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750911_3.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750911_3.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:11"
plot "dat/output_LMS_achim_1449750911_3.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750911_3.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750911_3_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750911_3_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750911_3_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750911_4.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750911_4.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:11"
plot "dat/output_LMS_achim_1449750911_4.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750911_4.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750911_4_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750911_4_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750911_4_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750911_5.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750911_5.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:11"
plot "dat/output_LMS_achim_1449750911_5.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750911_5.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750911_5_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750911_5_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750911_5_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750911_6.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750911_6.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:11"
plot "dat/output_LMS_achim_1449750911_6.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750911_6.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750911_6_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750911_6_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750911_6_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750911_7.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750911_7.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:11"
plot "dat/output_LMS_achim_1449750911_7.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750911_7.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750911_7_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750911_7_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750911_7_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750911_8.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750911_8.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:11"
plot "dat/output_LMS_achim_1449750911_8.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750911_8.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750911_8_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750911_8_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750911_8_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750911_9.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750911_9.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:11"
plot "dat/output_LMS_achim_1449750911_9.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750911_9.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750911_9_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750911_9_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750911_9_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750912_0.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750912_0.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:12"
plot "dat/output_LMS_achim_1449750912_0.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750912_0.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750912_0_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750912_0_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750912_0_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750912_1.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750912_1.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:12"
plot "dat/output_LMS_achim_1449750912_1.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750912_1.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750912_1_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750912_1_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750912_1_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750912_2.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750912_2.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:12"
plot "dat/output_LMS_achim_1449750912_2.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750912_2.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750912_2_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750912_2_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750912_2_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750912_3.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750912_3.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:12"
plot "dat/output_LMS_achim_1449750912_3.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750912_3.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750912_3_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750912_3_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750912_3_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750912_4.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750912_4.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:12"
plot "dat/output_LMS_achim_1449750912_4.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750912_4.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750912_4_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750912_4_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750912_4_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750912_5.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750912_5.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:12"
plot "dat/output_LMS_achim_1449750912_5.dat" u 1:2 lt rgb "red" title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750912_5.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750912_5_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750912_5_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750912_5_mod.dat" u 1:2 title "lars",
unset multiplot
set output
set output 'png/file1449750912_6.png'
set multiplot layout 2,3
set title "a"
plot "dat/output_LMS_irma_1449750912_6.dat" u 1:2 lt rgb "red" title "irma"
set title "2015-12-10 13:35:12"
plot "dat/output_LMS_achim_1449750912_6.dat" u 1:2 title "achi"
set title "a"
plot "dat/output_LMS_lars_1449750912_6.dat" u 1:2 lt rgb "red" title "lars"
set title "Aggregated with pose"
plot "dat/output_LMS_irma_1449750912_6_mod.dat" u 1:2 title "irma","dat/output_LMS_achim_1449750912_6_mod.dat" u 1:2 title "achi","dat/output_LMS_lars_1449750912_6_mod.dat" u 1:2 title "lars",
unset multiplot
set output
