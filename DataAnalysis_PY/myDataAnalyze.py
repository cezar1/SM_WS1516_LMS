
#!/usr/bin/python
#Data analysis
import sys
import time
import os
import subprocess
from myHistogram import *
from subprocess import call


myFileOutput=0

if len(sys.argv)!=3:
  print "Usage myDataAnalyze,py fileToAnalyze [x11/png]"
  sys.exit()
else:
  if str(sys.argv[2])=='x11':	
    print "x11 output"
    proc = subprocess.Popen(['gnuplot','-p'], 
			  shell=True,
			  stdin=subprocess.PIPE,
			  )
    proc.stdin.write('set terminal x11 size 1080,720\n')
  elif str(sys.argv[2])=='png':	
    print "png output"
    for fname in os.listdir('.'):
      if fname.endswith('.png'):
	# do stuff on the file
	os.popen('rm *.png')
	break
  elif str(sys.argv[2])=='gif':	
    print "gif output - press ctrl + C key to write the gif file"
    print "Writing to myAnimation.gif"
    proc = subprocess.Popen(['gnuplot','-p'], 
			  shell=True,
			  stdin=subprocess.PIPE,
			  )
    proc.stdin.write('set terminal gif size 1080,720 animate delay 100\n')
    proc.stdin.write('set output \'myAnimation.gif\'\n')
  else:
    print "No output specified, please choose x11 or png"
    sys.exit()



while True:	
  try:
    if os.path.isfile(sys.argv[1]):	
      myFileOutput+=1		
      with open(sys.argv[1]) as f:
	lines = f.readlines()
	os.remove(sys.argv[1])
	mySums=[]
	myDates=[]
	myTopicName="N_A"
	for line in lines:
	  data=line.split()
	  if str(data[0])=="#":
	    #special control information, do not parse normally
	    if str(data[1])=="topic":
	      myTopicName=str(data[2])
	  else:  
	    mySums.append(float(data[1]))
	    myDates.append(float(data[2]))
	del myGnuPlotCmds[:]
	myDateTimeStart=myDates[0]
	myDateTimeEnd=myDates[-1]
	if len(mySums)<=150:
	  myBinResolution=len(mySums)/2
	else:
	  myBinResolution=len(mySums)/10
	myGnuPlotCmds=myHistogram(mySums,myBinResolution,myDateTimeStart,myDateTimeEnd,myTopicName)
	if sys.argv[2]=='x11':		
	  print 'data #'+str(myFileOutput)
	  for cmd in myGnuPlotCmds:
	    #sys.stdout.write(cmd)
	    proc.stdin.write(cmd)
	elif sys.argv[2]=='png':
	  print 'set output \'file'+str(myFileOutput)+'.png\''
	  f = open('myGnuPlot.txt', 'w')
	  f.write('set terminal png size 1080,720\n')
	  f.write('set output \'file'+str(myFileOutput)+'.png\'\n')
	  for cmd in myGnuPlotCmds:
	    f.write(cmd)
	  f.write('quit\n')
	  f.close()
	  call(["gnuplot", "myGnuPlot.txt"])
	elif sys.argv[2]=='gif':		
	  print 'frame #'+str(myFileOutput)
	  for cmd in myGnuPlotCmds:
	    #sys.stdout.write(cmd)
	    proc.stdin.write(cmd)
    time.sleep(1)
  except KeyboardInterrupt:
    if sys.argv[2]=='gif':
      print "Writing to gif file.."
      proc.stdin.write('set output\n')
      proc.stdin.write('quit\n')
    break 
    


