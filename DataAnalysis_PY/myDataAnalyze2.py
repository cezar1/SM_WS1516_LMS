
#!/usr/bin/python
#Data analysis
import sys
import time
import os
import subprocess
from myGnu2DCartesian import myGnu2DCartesian,myGnu2DCartesianMakeEmpty
from subprocess import call
from collections import namedtuple
import datetime


myStopAfter=False
myStartOffset=20
myStopAfterSeconds=5

def mySend2GnuPlot(vCmd):
  #print vCmd
  myGnuFile.write(vCmd)

if len(sys.argv)!=3:
  print "Usage myDataAnalyze2.py fileToAnalyze [png/gif]"
  sys.exit()
else:
  #check if dat folder exists in program path
  if os.path.exists("dat"):
    os.popen('rm -rf dat')
  os.popen('mkdir dat')
  myGnuTargetFilename='myPlotGP_CMD.gnu'
  myGnuFile = open(myGnuTargetFilename, 'w')
  print "DataAnalyze2 - output is "+str(myGnuTargetFilename)+". Launch gnuplot after!"
  #if str(sys.argv[2])=='x11':	
    #print "x11 output"
    #proc = subprocess.Popen(['gnuplot','-p'], 
			  #shell=True,
			  #stdin=subprocess.PIPE,
			  #)
    #proc.stdin.write('set terminal x11 size 1080,720\n')
  #el
  if str(sys.argv[2])=='png':	
    print "png output"
    #check if dat folder exists in program path
    if os.path.exists("png"):
      os.popen('rm -rf png')
    os.popen('mkdir png')
    #proc = subprocess.Popen(['gnuplot','-p'], 
			  #shell=True,
			  #stdin=subprocess.PIPE,
			  #)
    mySend2GnuPlot('set terminal png size 600,800\n')
  elif str(sys.argv[2])=='gif':	
    print "gif output"
    mySend2GnuPlot('set terminal gif size 1200,800 animate delay 10\n')
    #proc.stdin.write('set terminal gif size 1080,720 animate delay 100\n')
    mySend2GnuPlot('set output \'myAnimation.gif\'\n')
  else:
    print "No output specified, please choose x11 or png"
    sys.exit()



  print "Finding "+sys.argv[1]+".."
  if os.path.isfile(sys.argv[1]):
    print "Opening "+sys.argv[1]+".."
    with open(sys.argv[1]) as f:
      lines = f.readlines()
      myDistinctDates=[]
      myTopicsNames=[]
      myTopicsPose=[]
      myPoints=[]
      myPointsContainer=[]
      myFirstData2DDone=[]
      myMaxRange=0
      #myTopicName="N_A"
      print "Contains "+str(len(lines))+" lines"
      for line in lines:
	data=line.split()
	if str(data[0])=="#":
	  #special control information, do not parse normally
	  if str(data[1])=="topic":
	    #general topic information, descriptor not needed
	    myTopicsNames.append(data[2])
	    myFirstData2DDone.append(False)
	    myTempPoints=[]
	    myPoints.append(myTempPoints)
	    myLocalTopicsPose=[]
	    for k in range(3,3+3):
	      #Add translate X,Y, rotation
	      myLocalTopicsPose.append(str(data[k]))
	    myTopicsPose.append(myLocalTopicsPose)
	  elif str(data[1])=="sum":
	    if len(myPointsContainer)>0:
	      myPoints[myTarget].append(myPointsContainer[:])
	    #sum is an agregate of data which follows, switch target topic entry
	    try: myTarget=myTopicsNames.index(data[2]); 
	    except ValueError: print "Topic "+str(data[2])+" not defined in topic statement"
	    #print "Found sum of topic "+str(data[2])+", putting data to index "+str(myTarget)
	    myPointsContainer=[]
	    myPointsContainer.append(data[5])#initialise point container
	    try: myDistinctDates.index(data[5]);
	    except ValueError: myDistinctDates.append(data[5])
	else:  
	  #on main data structure, myTarget is set
	  myPointsContainer.append(data[0])#angle
	  myPointsContainer.append(data[1])#range
	  if data[1]>myMaxRange:
	    myMaxRange=data[1]
    for i in range(0,len(myTopicsNames)):
      print "Topic "+str(myTopicsNames[i])+" has "+str(len(myPoints[i]))+" elements(incl date as point)"
    print "Total "+str(len(myDistinctDates))+" independent instances of seconds"
    #sort dates just in case 
    myDistinctDates.sort()
    
    #Preamble
    myMaxRange=2.5
    mySend2GnuPlot('myCartesianXStart='+str(myMaxRange)+'\n')
    mySend2GnuPlot('myCartesianXEnd='+str(myMaxRange)+'\n')
    mySend2GnuPlot('myCartesianYStart='+str(myMaxRange)+'\n')
    mySend2GnuPlot('myCartesianYEnd='+str(myMaxRange)+'\n')
    mySend2GnuPlot('set xzeroaxis\n')
    mySend2GnuPlot('set yzeroaxis\n')
    mySend2GnuPlot('set rmargin 1\n')
    mySend2GnuPlot('set lmargin 3\n')
    mySend2GnuPlot('set tmargin 2\n') 
    mySend2GnuPlot('set bmargin 2\n')
    mySend2GnuPlot('set xrange [-myCartesianXStart:myCartesianXEnd]\n')
    mySend2GnuPlot('set yrange [-myCartesianYStart:myCartesianYEnd]\n')
    mySend2GnuPlot('set size square\n')
    mySend2GnuPlot('set key right bottom\n')
    for myDate in myDistinctDates:
      DoPlot=False
      if myStopAfter:
	if myDistinctDates.index(myDate)>=myStartOffset:
	  DoPlot=True
	if myDistinctDates.index(myDate)>myStopAfterSeconds+myStartOffset:
	  break
      else:
	DoPlot=True
      #print myDate
      if DoPlot:
	#create a list of lists for the robot points
	myLocalLL=[]
	for i in range(0,len(myTopicsNames)):
	  myLocalPointContainer=[]
	  for myPoint in myPoints[i]:
	    if myDate==myPoint[0]:#match the current dates
	      myLocalPointContainer.append(myPoint)
	  myLocalLL.append(myLocalPointContainer)#save the list which matches the current date from certain topic
	print "Date "+str(myDate)+" has:"
	for i in range(0,len(myTopicsNames)):
	  print myTopicsNames[i]+" "+str(len(myLocalLL[i]))+" hits."
	#Gnuplot code creation: myLocalLL contains lists of myPoint, generate image code in gnuplot
	
	#Start on step 0
	myFoundAnyPointImage=False
	
	for i in range(0,len(myTopicsNames)):
	  myFoundAnyPointImage=myFoundAnyPointImage or len(myLocalLL[i])>0
	myStartStep=0
	while myFoundAnyPointImage:

	  #print "Sequence "+str(myStartStep)
	  myFoundAnyPointImage=False
	  myGnuPlotOutput=[]
	  #first determine if there is still any image on current level
	  for i in range(0,len(myTopicsNames)):
	    if len(myLocalLL[i])>=myStartStep+1:
	      myFoundAnyPointImage=True
	  if myFoundAnyPointImage:
	    myAgregateGnuCmds=[]
	    #myAgregateGnuCmds.append('unset multiplot\n')
	    #myAgregateGnuCmds.append('set bmargin at screen 0.1\n')
	    myAgregateGnuCmds.append('set title "Aggregated with pose"\n')
	    myAgregateGnuCmds.append('plot ')
	    myAgregatePointList=[]
	    if str(sys.argv[2])=='png':
	      mySend2GnuPlot('set output \'png/file'+str(myDate)+"_"+str(myStartStep)+'.png\'\n')
	    #mySend2GnuPlot('set multiplot layout 2,1\n')
	    mySend2GnuPlot('set multiplot layout 2,'+str(len(myTopicsNames))+'\n')
	    for i in range(0,len(myTopicsNames)):
	      #print str(len(myLocalLL[i]))+">="+str(myStartStep)
	      myQualifiedTopicName=myTopicsNames[i]+"_"+str(myDate)+"_"+str(myStartStep)
	      myLocalGnuCmds=[]
	      if (i==1):
		myDateTimeObj=datetime.datetime.fromtimestamp(float(myDate))
		myLocalGnuCmds.append('set title "'+str(myDateTimeObj.strftime("%Y-%m-%d %H:%M:%S"))+'"\n')
	      else:
		myLocalGnuCmds.append('set title "a"\n')
	      if len(myLocalLL[i])>=myStartStep+1:
		myResult=myGnu2DCartesian(myLocalLL[i][myStartStep],myQualifiedTopicName,myDate,myTopicsPose[i])
		myLocalGnuCmds.append(myResult[0])
		myAgregateGnuCmds.append(myResult[1])
		myFoundAnyPointImage=True
		#print len(myGnuPlotOutput)
	      else:
		#this topic does not have hits, just put empty
		myResult=myGnu2DCartesianMakeEmpty(myQualifiedTopicName)
		myLocalGnuCmds.append(myResult[0])
		myAgregateGnuCmds.append(myResult[1])
		myAgregateGnuCmds.append(',')
		#myAgregatePointList+=myGnu2DCartesianMakeEmpty("/LMS_agregated")
	      #get a command list for combined graph
	      #myAgregateGnuCmds+=myGnu2DCartesian(myAgregatePointList,"/LMS_agregated",myDate)
	      myGnuPlotOutput+=myLocalGnuCmds
	    #mySend2GnuPlot('plot ')
	    myGnuPlotOutput+=myAgregateGnuCmds
	    myGnuPlotOutput.append('\n')
	    
	    #get a plot command for all the points
	    
	    for i in range(0,len(myGnuPlotOutput)):
	      mySend2GnuPlot(myGnuPlotOutput[i])
	    mySend2GnuPlot('unset multiplot\n')
	    if str(sys.argv[2])=='png':
	      mySend2GnuPlot('set output\n')
	  myStartStep+=1
  else:
    print "Input file not found!"
  myGnuFile.close()
      
	    

	  
      
     
      
      #mySend2GnuPlot("set multiplot layout 3,1")
      #for i in range(0,len(myTopicsNames)):
	##print myTopicsNames[i]+" "+str(len(myLocalLL[i]))+" hits."
	#for j in range(0,len(myLocalLL[i])):
	  #if not myFirstData2DDone[i]:
	    
	    #myGnuPlotOutput=myGnu2DCartesian(myLocalLL[i][j],myTopicsNames[i])
	    
	    #for myCmd in myGnuPlotOutput:
	      #mySend2GnuPlot(myCmd)
	    #myFirstData2DDone[i]=True
      

	
  
	    #mySums.append(float(data[1]))
	    #myDates.append(float(data[2]))
	#del myGnuPlotCmds[:]
	#myDateTimeStart=myDates[0]
	#myDateTimeEnd=myDates[-1]
	#if len(mySums)<=150:
	  #myBinResolution=len(mySums)/2
	#else:
	  #myBinResolution=len(mySums)/10
	#myGnuPlotCmds=myHistogram(mySums,myBinResolution,myDateTimeStart,myDateTimeEnd,myTopicName)
	#if sys.argv[2]=='x11':		
	  #print 'data #'+str(myFileOutput)
	  #for cmd in myGnuPlotCmds:
	    ##sys.stdout.write(cmd)
	    #proc.stdin.write(cmd)
	#elif sys.argv[2]=='png':
	  #print 'set output \'file'+str(myFileOutput)+'.png\''
	  #f = open('myGnuPlot.txt', 'w')
	  #f.write('set terminal png size 1080,720\n')
	  #f.write('set output \'file'+str(myFileOutput)+'.png\'\n')
	  #for cmd in myGnuPlotCmds:
	    #f.write(cmd)
	  #f.write('quit\n')
	  #f.close()
	  #call(["gnuplot", "myGnuPlot.txt"])
	#elif sys.argv[2]=='gif':		
	  #print 'frame #'+str(myFileOutput)
	  #for cmd in myGnuPlotCmds:
	    ##sys.stdout.write(cmd)
	    #proc.stdin.write(cmd)
    #time.sleep(1)
  #except KeyboardInterrupt:
    #if sys.argv[2]=='gif':
      #print "Writing to gif file.."
      #proc.stdin.write('set output\n')
      #proc.stdin.write('quit\n')
    #break 
