import subprocess
proc = subprocess.Popen(['gnuplot','-p'], 
                        shell=True,
                        stdin=subprocess.PIPE,
                        )
proc.stdin.write('set xrange [0:10]; set yrange [-2:2]\n')
proc.stdin.write('plot sin(x) axes x1y1\n')
raw_input('Please press return to continue...\n')
proc.stdin.write('quit\n') #close the gnuplot window