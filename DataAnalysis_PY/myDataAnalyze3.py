
#!/usr/bin/python
#Data analysis
import sys
import os
from myGnu2DCartesian import myGnu2DCartesian,myGnu2DCartesianMakeEmpty
from myICP_Consecutive import myICP_Consecutive,myICP_Consecutive_MakeEmpty
import datetime


myStopAfter=True
myStartOffset=10
myStopAfterSeconds=8
myBackGroundSampleIndex=3#target date to extract background features
myShowCentroid=False#trajectory
myShowLineFitTraj=True#trajectory
myShowLineFit=True
myShowICPMatches=False

def mySend2GnuPlot(vCmd):
  #print vCmd
  myGnuFile.write(vCmd)

if len(sys.argv)!=3:
  print "Usage myDataAnalyze3.py fileToAnalyze [png/gif]"
  sys.exit()
else:
  #check if dat folder exists in program path
  if os.path.exists("dat"):
    os.popen('rm -rf dat')
  os.popen('mkdir dat')
  myGnuTargetFilename='myPlotGP_ICP_CMD.gnu'
  myGnuFile = open(myGnuTargetFilename, 'w')
  print "DataAnalyze3 - output is "+str(myGnuTargetFilename)+". Launch gnuplot after!"
  if str(sys.argv[2])=='png':
    print "png output"
    #check if dat folder exists in program path
    if os.path.exists("png"):
      os.popen('rm -rf png')
    os.popen('mkdir png')
    mySend2GnuPlot('set terminal png size 1200,800\n')
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
      myBackGroundLL=[]
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
    
    #obtain background sample
    myBackGroundDate=myDistinctDates[myBackGroundSampleIndex];
    print "Background date:"+myBackGroundDate
    myBackgroundContainer=[]
    for i in range(0,len(myTopicsNames)):
      myLocalPointContainer=[]
      for myPoint in myPoints[i]:
	if myBackGroundDate==myPoint[0]:#match the current dates
	  myLocalPointContainer.append(myPoint)
      myBackgroundContainer.append(myLocalPointContainer[0])
      print "Topic "+myTopicsNames[i]+" has "+str(len(myBackgroundContainer[i]))+" ranges(angle+distance) +1 date in background sample"
	  
    #Preamble
    myMaxRange=1.5
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
    myFileOutput=0
    myICP_PreviousDataSet=[]
    myEmptyList=[]
    myICP_PreviousDataSet.append(myEmptyList)
    myICP_PreviousDataSet.append(myEmptyList)
    myICP_PreviousDataSet.append(myEmptyList)
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
	  myGnuPlotOutput2=[]
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
	      #mySend2GnuPlot('set output \'png/file'+'%5s' % myFileOutput+'.png\'\n')
	      mySend2GnuPlot('set output \'png/file'+str(myFileOutput).zfill(5)+'.png\'\n')
	      myFileOutput=myFileOutput+1
	    #mySend2GnuPlot('set multiplot layout 2,1\n')
	    mySend2GnuPlot('set multiplot layout 2,'+str(len(myTopicsNames))+'\n')
	    for i in range(0,len(myTopicsNames)):
	      #print str(len(myLocalLL[i]))+">="+str(myStartStep)
	      myQualifiedTopicName=myTopicsNames[i]+"_"+str(myDate)+"_"+str(myStartStep)
	      #myLocalGnuCmds=[]
	      myLocalGnuCmds2=[]
	      myLocalGnuCmds3=[]
	      if (i==0):
		myLocalGnuCmds2.append('set xrange [-myCartesianXStart:myCartesianXEnd]\n')
		myLocalGnuCmds2.append('set yrange [-myCartesianYStart:myCartesianYEnd]\n')
	      if (i==1):
		myDateTimeObj=datetime.datetime.fromtimestamp(float(myDate))
		myDateTimeObjBack=datetime.datetime.fromtimestamp(float(myBackGroundDate))
		#myLocalGnuCmds.append('set title "'+str(myDateTimeObj.strftime("%Y-%m-%d %H:%M:%S"))+'"\n')
		myLocalGnuCmds2.append('set title "'+str(myDateTimeObj.strftime("%Y-%m-%d %H:%M:%S"))+' with background '+str(myDateTimeObjBack.strftime("%Y-%m-%d %H:%M:%S"))+'"\n')
		if myShowCentroid and myShowLineFitTraj:
		  myLocalGnuCmds3.append('set title "Centroid and line fitting"\n')
		elif myShowCentroid:
		  myLocalGnuCmds3.append('set title "ICP matching with centroid trajectory"\n')
		else:
		  myLocalGnuCmds3.append('set title "Line fitting trajectory"\n')
	      else:
		#myLocalGnuCmds.append('set title "-"\n')
		myLocalGnuCmds2.append('set title "-"\n')
		myLocalGnuCmds3.append('set title "-"\n')
	      if len(myLocalLL[i])>=myStartStep+1:
		#myResult=myGnu2DCartesian(myLocalLL[i][myStartStep],myQualifiedTopicName,myDate,myTopicsPose[i],myBackgroundContainer[i])
		#myLocalGnuCmds.append(myResult[0])
		#myAgregateGnuCmds.append(myResult[1])
		#myLocalGnuCmds2.append(myResult[2])
		if len(myICP_PreviousDataSet[i])>0:
		  myResult_ICP=myICP_Consecutive(myLocalLL[i][myStartStep],myICP_PreviousDataSet[i],myQualifiedTopicName,myDate,myTopicsPose[i],myBackgroundContainer[i])
		  #myLocalGnuCmds3.append(myResult_ICP[2])
		  #myDynamicRangeXStart=-0.5
		  #myDynamicRangeXEnd=-0.3
		  #myDynamicRangeYStart=-0.5
		  #myDynamicRangeYEnd=-0.3
		  #myLocalGnuCmds2.append('set xrange ['+str(myDynamicRangeXStart)+':'+str(myDynamicRangeXEnd)+']\n')
		  #myLocalGnuCmds2.append('set yrange ['+str(myDynamicRangeYStart)+':'+str(myDynamicRangeYEnd)+']\n')
		  #first line of graphs
		  if myShowCentroid and myShowLineFitTraj:
		    myLocalGnuCmds2.append(myResult_ICP[5])
		    myLocalGnuCmds2.append(myResult_ICP[8])
		    myLocalGnuCmds2.append(myResult_ICP[11])
		  elif myShowCentroid:
		    myLocalGnuCmds2.append(myResult_ICP[5])
		    myLocalGnuCmds2.append(myResult_ICP[8])
		  elif myShowLineFit:
		    myLocalGnuCmds2.append(myResult_ICP[5])
		    myLocalGnuCmds2.append(myResult_ICP[9])
		    myLocalGnuCmds2.append(myResult_ICP[10])
		    myLocalGnuCmds2.append(myResult_ICP[11])
		  else:
		    myLocalGnuCmds2.append(myResult_ICP[2])
		  
		  
		  #second line of graphs
		  myLocalGnuCmds3.append(myResult_ICP[3])
		  myLocalGnuCmds3.append(myResult_ICP[4])
		  myLocalGnuCmds3.append(myResult_ICP[5])
		  
		  if myShowCentroid and myShowLineFitTraj:
		    myLocalGnuCmds3.append(myResult_ICP[8])
		    myLocalGnuCmds3.append(myResult_ICP[11])
		  elif myShowICPMatches:
		    myLocalGnuCmds3.append(myResult_ICP[6])
		    myLocalGnuCmds3.append(myResult_ICP[7])
		  else:
		    if myShowCentroid:
		      myLocalGnuCmds3.append(myResult_ICP[8])
		    #else:
		      #myLocalGnuCmds3.append('\n')
		    if myShowLineFit:
		      myLocalGnuCmds3.append(myResult_ICP[9])
		      myLocalGnuCmds3.append(myResult_ICP[10])
		      myLocalGnuCmds3.append(myResult_ICP[11])
		    else:
		      myLocalGnuCmds3.append('\n')
		else:
		  myResult_ICP=myICP_Consecutive_MakeEmpty(myQualifiedTopicName)
		  myLocalGnuCmds2.append(myResult_ICP[0])
		  myLocalGnuCmds3.append(myResult_ICP[0])
		myICP_PreviousDataSet[i]=myLocalLL[i][myStartStep]
		myFoundAnyPointImage=True
		#print len(myGnuPlotOutput)
	      else:
		#this topic does not have hits, just put empty
		myResult=myGnu2DCartesianMakeEmpty(myQualifiedTopicName)
		myLocalGnuCmds.append(myResult[0])
		myAgregateGnuCmds.append(myResult[1])
		#use same single empty data in case there is no points
		myLocalGnuCmds2.append(myResult[0])
		myResult_ICP=myICP_Consecutive_MakeEmpty(myQualifiedTopicName)
		myLocalGnuCmds3.append(myResult_ICP[0])
		myAgregateGnuCmds.append(',')
		#myAgregatePointList+=myGnu2DCartesianMakeEmpty("/LMS_agregated")
	      #get a command list for combined graph
	      #myAgregateGnuCmds+=myGnu2DCartesian(myAgregatePointList,"/LMS_agregated",myDate)
	      #do not plot anymore the complete picture
	      #myGnuPlotOutput+=myLocalGnuCmds
	      #myLocalGnuCmds2 is subtracted image
	      myGnuPlotOutput+=myLocalGnuCmds2
	      #myLocalGnuCmds3 is result of ICP algorithm
	      myGnuPlotOutput2+=myLocalGnuCmds3
	    #mySend2GnuPlot('plot ')
	    #Use below for aggregate points
	    #myGnuPlotOutput+=myAgregateGnuCmds
	    #myGnuPlotOutput.append('\n')

	    #get a plot command for all the points

	    for i in range(0,len(myGnuPlotOutput)):
	      mySend2GnuPlot(myGnuPlotOutput[i])
	    for i in range(0,len(myGnuPlotOutput2)):
	      mySend2GnuPlot(myGnuPlotOutput2[i])
	    mySend2GnuPlot('unset multiplot\n')
	    if str(sys.argv[2])=='png':
	      mySend2GnuPlot('set output\n')
	  myStartStep+=1
  else:
    print "Input file not found!"
  myGnuFile.close()

