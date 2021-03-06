
#!/usr/bin/python
#Data analysis
import sys
import os
from myGnu2DCartesian import myGnu2DCartesian,myGnu2DCartesianMakeEmpty
from myICP_Consecutive import myICP_Consecutive,myICP_Consecutive_MakeEmpty
import datetime


myStopAfter=True
myStartOffset=10
myStopAfterSeconds=7#2
myBackGroundSampleIndex=3#target date to extract background features
myShowCentroid=True#trajectory
myShowICPPrediction=True#trajectory
myShowLineFitTraj=True#trajectory
myShowLineFit=True
myShowICPMatches=False
myHistoryCapacity=2#how many steps to run the ICP over
myICPIterations=3#how many iterations to run the ICP

gnuCmdIdx_ORIGINAL=0
gnuCmdIdx_ROTATED=1
gnuCmdIdx_SUBTRACTED=2
gnuCmdIdx_ZOOM1X=3
gnuCmdIdx_ZOOM1Y=4
gnuCmdIdx_ZOOM2X=5
gnuCmdIdx_ZOOM2Y=6
gnuCmdIdx_SUBTRACTED2=7
gnuCmdIdx_PREVIOUS=8
gnuCmdIdx_ICP_MATCHES=9
gnuCmdIdx_CENTROID=10
gnuCmdIdx_LINE_FITS=11
gnuCmdIdx_BOX=12
gnuCmdIdx_BOX_TRAJ=13
gnuCmdIdx_ICP_TRAJ=14
gnuCmdIdx_KALMAN=15
gnuCmdIdx_ICP_VECTOR=16
gnuCmdIdx_BOX_VECTOR=17
gnuCmdIdx_KALMAN_VECTOR=18
gnuCmdIdx_LAST=18

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
      myICP_Pose=[]
      myICP_Initialized=[]
      myPoints=[]
      myPointsContainer=[]
      myFirstData2DDone=[]
      myBackGroundLL=[]
      myICP_PreviousHistory=[]
      myHavePreviousUpTo=[]
      myKalmanData=[]
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
	    myLocalTopicsICP_Pose=[]
	    myLocalICP_Init=[]
	    myICP_PreviousHistory.append([])
	    myLocalHavePreviousUpTo=[]
	    myLocalHavePreviousUpTo.append(0)
	    myKalmanData.append([])
	    for k in range(3,3+3):
	      #Add translate X,Y, rotation
	      myLocalTopicsPose.append(str(data[k]))
	      myLocalTopicsICP_Pose.append(0)   
	      myLocalICP_Init.append(False)
	    myTopicsPose.append(myLocalTopicsPose)
	    myICP_Pose.append(myLocalTopicsICP_Pose)
	    myICP_Initialized.append(myLocalICP_Init)
	    myHavePreviousUpTo.append(myLocalHavePreviousUpTo)
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
	      myGnuCmdCore=[]
	      myGnuCmdCoreLine1=[]
	      myGnuCmdInitLine1=[]
	      myGnuCmdInitLine2=[]
	      myLocalZoom=[]
	      if (i==0):
		myGnuCmdInitLine1.append('set xrange [-myCartesianXStart:myCartesianXEnd]\n')
		myGnuCmdInitLine1.append('set yrange [-myCartesianYStart:myCartesianYEnd]\n')
	      if (i==1):
		myDateTimeObj=datetime.datetime.fromtimestamp(float(myDate))
		myDateTimeObjBack=datetime.datetime.fromtimestamp(float(myBackGroundDate))
		#myGnuCmdCore.append('set title "'+str(myDateTimeObj.strftime("%Y-%m-%d %H:%M:%S"))+'"\n')
		myGnuCmdInitLine1.append('set title "'+str(myDateTimeObj.strftime("%Y-%m-%d %H:%M:%S"))+' with background '+str(myDateTimeObjBack.strftime("%Y-%m-%d %H:%M:%S"))+'"\n')
		if myShowICPPrediction and myShowCentroid and myShowLineFitTraj:
		  myGnuCmdInitLine2.append('set title "ICP prediction with ['+str(myICPIterations)+'] iterations and ['+str(myHistoryCapacity)+'] steps over, box fitting and Kalman fuse from ICP and box fit (+ICP reset from box) "\n')
		elif myShowCentroid and myShowLineFitTraj:
		  myGnuCmdInitLine2.append('set title "Centroid and line fitting"\n')
		elif myShowCentroid:
		  myGnuCmdInitLine2.append('set title "ICP matching with centroid trajectory"\n')
		else:
		  myGnuCmdInitLine2.append('set title "Line fitting trajectory"\n')
	      else:
		#myGnuCmdCore.append('set title "-"\n')
		myGnuCmdInitLine1.append('set title "-"\n')
		myGnuCmdInitLine2.append('set title "-"\n')
	      if len(myLocalLL[i])>=myStartStep+1:   
		if len(myICP_PreviousDataSet[i])>0:
		  myResult_ICP=myICP_Consecutive(myLocalLL[i][myStartStep],myICP_PreviousDataSet[i],myQualifiedTopicName,myDate,myTopicsPose[i],myBackgroundContainer[i],myICP_Pose[i],myICP_Initialized[i],myICP_PreviousHistory[i],myHistoryCapacity,myHavePreviousUpTo[i],myICPIterations,myKalmanData[i])
		  #myIdxTarget=gnuCmdIdx_SUBTRACTED 
		  #if len(myResult_ICP[myIdxTarget])>0:
		    #myGnuCmdCoreLine1.append(myResult_ICP[myIdxTarget])
		    #if len(myResult_ICP[gnuCmdIdx_KALMAN_VECTOR])>0:
		      #myGnuCmdCoreLine1.append(',')
		    #else:
		      #myGnuCmdCoreLine1.append('\n')
		  #myIdxTarget=gnuCmdIdx_KALMAN_VECTOR
		  #if len(myResult_ICP[myIdxTarget])>0:
		    #myGnuCmdCoreLine1.append(myResult_ICP[myIdxTarget])
		    #myGnuCmdCoreLine1.append('\n')
		  myGnuCmdInitLine1.append(myResult_ICP[gnuCmdIdx_ZOOM1X])
		  myGnuCmdInitLine1.append('\n')
		  myGnuCmdInitLine1.append(myResult_ICP[gnuCmdIdx_ZOOM1Y])
		  myGnuCmdInitLine1.append('\n')
		  
		  myGnuCmdInitLine2.append(myResult_ICP[gnuCmdIdx_ZOOM2X])
		  myGnuCmdInitLine2.append('\n')
		  myGnuCmdInitLine2.append(myResult_ICP[gnuCmdIdx_ZOOM2Y])
		  myGnuCmdInitLine2.append('\n')
		  #Both lines are identical and built on myGnuCmdCore
		  #LINE 1
		  myGnuCmdLocalObj=[] 
		  myGnuCmdShow=[myN for myN in range(gnuCmdIdx_LAST+1)]
		  myGnuCmdShow[gnuCmdIdx_ORIGINAL]=False
		  myGnuCmdShow[gnuCmdIdx_ROTATED]=False
		  myGnuCmdShow[gnuCmdIdx_SUBTRACTED]=True
		  myGnuCmdShow[gnuCmdIdx_ZOOM1X]=False
		  myGnuCmdShow[gnuCmdIdx_ZOOM1Y]=False
		  myGnuCmdShow[gnuCmdIdx_ZOOM2X]=False
		  myGnuCmdShow[gnuCmdIdx_ZOOM2Y]=False
		  myGnuCmdShow[gnuCmdIdx_SUBTRACTED2]=False
		  myGnuCmdShow[gnuCmdIdx_PREVIOUS]=False
		  myGnuCmdShow[gnuCmdIdx_ICP_MATCHES]=False
		  myGnuCmdShow[gnuCmdIdx_CENTROID]=False
		  myGnuCmdShow[gnuCmdIdx_LINE_FITS]=False
		  myGnuCmdShow[gnuCmdIdx_BOX]=False
		  myGnuCmdShow[gnuCmdIdx_BOX_TRAJ]=True
		  myGnuCmdShow[gnuCmdIdx_ICP_TRAJ]=True
		  myGnuCmdShow[gnuCmdIdx_KALMAN]=True
		  myGnuCmdShow[gnuCmdIdx_ICP_VECTOR]=True
		  myGnuCmdShow[gnuCmdIdx_BOX_VECTOR]=False
		  myGnuCmdShow[gnuCmdIdx_KALMAN_VECTOR]=True
		  for myGnuCmdTarget in range (0,gnuCmdIdx_LAST+1):
		    myKeepComma=False
		    for myGnuCmdParse in range (myGnuCmdTarget+1,gnuCmdIdx_LAST+1):
		      if myGnuCmdShow[myGnuCmdParse]:
			myKeepComma=True
			#print "myKeepComma TRUE"
			break
		    if myGnuCmdShow[myGnuCmdTarget] and len(myResult_ICP[myGnuCmdTarget])>0:
		      myGnuCmdLocalObj.append(myResult_ICP[myGnuCmdTarget])
		      if myKeepComma:
			myGnuCmdLocalObj.append(',')
		      else:
			myGnuCmdLocalObj.append('\n')
		  myGnuCmdCoreLine1=myGnuCmdLocalObj
		  #LINE 2
		  myGnuCmdLocalObj=[] 
		  myGnuCmdShow=[myN for myN in range(gnuCmdIdx_LAST+1)]
		  myGnuCmdShow[gnuCmdIdx_ORIGINAL]=False
		  myGnuCmdShow[gnuCmdIdx_ROTATED]=False
		  myGnuCmdShow[gnuCmdIdx_SUBTRACTED]=True
		  myGnuCmdShow[gnuCmdIdx_ZOOM1X]=False
		  myGnuCmdShow[gnuCmdIdx_ZOOM1Y]=False
		  myGnuCmdShow[gnuCmdIdx_ZOOM2X]=False
		  myGnuCmdShow[gnuCmdIdx_ZOOM2Y]=False
		  myGnuCmdShow[gnuCmdIdx_SUBTRACTED2]=False
		  myGnuCmdShow[gnuCmdIdx_PREVIOUS]=True
		  myGnuCmdShow[gnuCmdIdx_ICP_MATCHES]=True
		  myGnuCmdShow[gnuCmdIdx_CENTROID]=False
		  myGnuCmdShow[gnuCmdIdx_LINE_FITS]=True
		  myGnuCmdShow[gnuCmdIdx_BOX]=False
		  myGnuCmdShow[gnuCmdIdx_BOX_TRAJ]=False
		  myGnuCmdShow[gnuCmdIdx_ICP_TRAJ]=False
		  myGnuCmdShow[gnuCmdIdx_KALMAN]=False
		  myGnuCmdShow[gnuCmdIdx_ICP_VECTOR]=True
		  myGnuCmdShow[gnuCmdIdx_BOX_VECTOR]=True
		  myGnuCmdShow[gnuCmdIdx_KALMAN_VECTOR]=True
		  for myGnuCmdTarget in range (0,gnuCmdIdx_LAST+1):
		    myKeepComma=False
		    for myGnuCmdParse in range (myGnuCmdTarget+1,gnuCmdIdx_LAST+1):
		      if myGnuCmdShow[myGnuCmdParse]:
			myKeepComma=True
			#print "myKeepComma TRUE"
			break
		    if myGnuCmdShow[myGnuCmdTarget] and len(myResult_ICP[myGnuCmdTarget])>0:
		      myGnuCmdLocalObj.append(myResult_ICP[myGnuCmdTarget])
		      if myKeepComma:
			myGnuCmdLocalObj.append(',')
		      else:
			myGnuCmdLocalObj.append('\n')
		  myGnuCmdCore=myGnuCmdLocalObj
		  
		  #myIdxTarget=gnuCmdIdx_SUBTRACTED
		  #if len(myResult_ICP[myIdxTarget])>0:
		    #myGnuCmdCore.append(myResult_ICP[myIdxTarget])
		    #if len(myResult_ICP[gnuCmdIdx_CENTROID])>0 or len(myResult_ICP[gnuCmdIdx_LINE_FITS])>0 or len(myResult_ICP[gnuCmdIdx_BOX])>0 or len(myResult_ICP[gnuCmdIdx_BOX_TRAJ])>0 or len(myResult_ICP[gnuCmdIdx_ICP_TRAJ])>0 or len(myResult_ICP[gnuCmdIdx_KALMAN])>0 or len(myResult_ICP[gnuCmdIdx_ICP_VECTOR])>0 or len(myResult_ICP[gnuCmdIdx_BOX_VECTOR]) or len(myResult_ICP[gnuCmdIdx_ICP_MATCHES]) or len(myResult_ICP[gnuCmdIdx_PREVIOUS]) or len(myResult_ICP[gnuCmdIdx_KALMAN_VECTOR]):
		      #myGnuCmdCore.append(',')
		    #else:
		      #myGnuCmdCore.append('\n')
		  #myIdxTarget=gnuCmdIdx_CENTROID
		  #if len(myResult_ICP[myIdxTarget])>0:
		    #myGnuCmdCore.append(myResult_ICP[myIdxTarget])
		    #if len(myResult_ICP[gnuCmdIdx_LINE_FITS])>0 or len(myResult_ICP[gnuCmdIdx_BOX])>0 or len(myResult_ICP[gnuCmdIdx_BOX_TRAJ])>0 or len(myResult_ICP[gnuCmdIdx_ICP_TRAJ])>0 or len(myResult_ICP[gnuCmdIdx_KALMAN])>0 or len(myResult_ICP[gnuCmdIdx_ICP_VECTOR])>0 or len(myResult_ICP[gnuCmdIdx_BOX_VECTOR]) or len(myResult_ICP[gnuCmdIdx_ICP_MATCHES]) or len(myResult_ICP[gnuCmdIdx_PREVIOUS]) or len(myResult_ICP[gnuCmdIdx_KALMAN_VECTOR]):
		      #myGnuCmdCore.append(',')
		    #else:
		      #myGnuCmdCore.append('\n')
		  #myIdxTarget=gnuCmdIdx_LINE_FITS
		  #if len(myResult_ICP[myIdxTarget])>0:
		    #myGnuCmdCore.append(myResult_ICP[myIdxTarget])
		    #if len(myResult_ICP[gnuCmdIdx_BOX])>0 or len(myResult_ICP[gnuCmdIdx_BOX_TRAJ])>0 or len(myResult_ICP[gnuCmdIdx_ICP_TRAJ])>0 or len(myResult_ICP[gnuCmdIdx_KALMAN])>0 or len(myResult_ICP[gnuCmdIdx_ICP_VECTOR])>0 or len(myResult_ICP[gnuCmdIdx_BOX_VECTOR]) or len(myResult_ICP[gnuCmdIdx_ICP_MATCHES]) or len(myResult_ICP[gnuCmdIdx_PREVIOUS]) or len(myResult_ICP[gnuCmdIdx_KALMAN_VECTOR]):
		      #myGnuCmdCore.append(',')
		    #else:
		      #myGnuCmdCore.append('\n')
		  #myIdxTarget=gnuCmdIdx_BOX_TRAJ
		  #if len(myResult_ICP[myIdxTarget])>0:
		    #myGnuCmdCore.append(myResult_ICP[myIdxTarget])
		    #if len(myResult_ICP[gnuCmdIdx_BOX])>0 or len(myResult_ICP[gnuCmdIdx_ICP_TRAJ])>0 or len(myResult_ICP[gnuCmdIdx_KALMAN])>0 or len(myResult_ICP[gnuCmdIdx_ICP_VECTOR])>0 or len(myResult_ICP[gnuCmdIdx_BOX_VECTOR]) or len(myResult_ICP[gnuCmdIdx_ICP_MATCHES]) or len(myResult_ICP[gnuCmdIdx_PREVIOUS]) or len(myResult_ICP[gnuCmdIdx_KALMAN_VECTOR]):
		      #myGnuCmdCore.append(',')
		    #else:
		      #myGnuCmdCore.append('\n')	 
		  #myIdxTarget=gnuCmdIdx_ICP_TRAJ
		  #if len(myResult_ICP[myIdxTarget])>0:
		    #myGnuCmdCore.append(myResult_ICP[myIdxTarget])
		    #if len(myResult_ICP[gnuCmdIdx_BOX])>0 or len(myResult_ICP[gnuCmdIdx_KALMAN])>0 or len(myResult_ICP[gnuCmdIdx_ICP_VECTOR])>0 or len(myResult_ICP[gnuCmdIdx_BOX_VECTOR]) or len(myResult_ICP[gnuCmdIdx_ICP_MATCHES]) or len(myResult_ICP[gnuCmdIdx_PREVIOUS]) or len(myResult_ICP[gnuCmdIdx_KALMAN_VECTOR]):
		      #myGnuCmdCore.append(',')
		    #else:
		      #myGnuCmdCore.append('\n')
		  #myIdxTarget=gnuCmdIdx_KALMAN
		  #if len(myResult_ICP[myIdxTarget])>0:
		    #myGnuCmdCore.append(myResult_ICP[myIdxTarget])
		    #if len(myResult_ICP[gnuCmdIdx_BOX])>0 or len(myResult_ICP[gnuCmdIdx_ICP_VECTOR])>0 or len(myResult_ICP[gnuCmdIdx_BOX_VECTOR]) or len(myResult_ICP[gnuCmdIdx_ICP_MATCHES]) or len(myResult_ICP[gnuCmdIdx_PREVIOUS]) or len(myResult_ICP[gnuCmdIdx_KALMAN_VECTOR]):
		      #myGnuCmdCore.append(',')
		    #else:
		      #myGnuCmdCore.append('\n')
		  #myIdxTarget=gnuCmdIdx_ICP_VECTOR
		  #if len(myResult_ICP[myIdxTarget])>0:
		    #myGnuCmdCore.append(myResult_ICP[myIdxTarget])
		    #if len(myResult_ICP[gnuCmdIdx_BOX])>0 or len(myResult_ICP[gnuCmdIdx_BOX_VECTOR]) or len(myResult_ICP[gnuCmdIdx_ICP_MATCHES]) or len(myResult_ICP[gnuCmdIdx_PREVIOUS]) or len(myResult_ICP[gnuCmdIdx_KALMAN_VECTOR]):
		      #myGnuCmdCore.append(',')
		    #else:
		      #myGnuCmdCore.append('\n')
		  #myIdxTarget=gnuCmdIdx_BOX_VECTOR
		  #if len(myResult_ICP[myIdxTarget])>0:
		    #myGnuCmdCore.append(myResult_ICP[myIdxTarget])
		    #if len(myResult_ICP[gnuCmdIdx_BOX])>0 or len(myResult_ICP[gnuCmdIdx_ICP_MATCHES]) or len(myResult_ICP[gnuCmdIdx_PREVIOUS]) or len(myResult_ICP[gnuCmdIdx_KALMAN_VECTOR]):
		      #myGnuCmdCore.append(',')
		    #else:
		      #myGnuCmdCore.append('\n')
		  #myIdxTarget=gnuCmdIdx_ICP_MATCHES
		  #if len(myResult_ICP[myIdxTarget])>0:
		    #myGnuCmdCore.append(myResult_ICP[myIdxTarget])
		    #if len(myResult_ICP[gnuCmdIdx_BOX])>0 or len(myResult_ICP[gnuCmdIdx_PREVIOUS]) or len(myResult_ICP[gnuCmdIdx_KALMAN_VECTOR]):
		      #myGnuCmdCore.append(',')
		    #else:
		      #myGnuCmdCore.append('\n')
		  #myIdxTarget=gnuCmdIdx_PREVIOUS
		  #if len(myResult_ICP[myIdxTarget])>0:
		    #myGnuCmdCore.append(myResult_ICP[myIdxTarget])
		    #if len(myResult_ICP[gnuCmdIdx_BOX])>0 or len(myResult_ICP[gnuCmdIdx_KALMAN_VECTOR]):
		      #myGnuCmdCore.append(',')
		    #else:
		      #myGnuCmdCore.append('\n')
		  #myIdxTarget=gnuCmdIdx_KALMAN_VECTOR
		  #if len(myResult_ICP[myIdxTarget])>0:
		    #myGnuCmdCore.append(myResult_ICP[myIdxTarget])
		    #if len(myResult_ICP[gnuCmdIdx_BOX])>0:
		      #myGnuCmdCore.append(',')
		    #else:
		      #myGnuCmdCore.append('\n')
		  #myIdxTarget=gnuCmdIdx_BOX
		  #if len(myResult_ICP[myIdxTarget])>0:
		    #myGnuCmdCore.append(myResult_ICP[myIdxTarget])
		    #myGnuCmdCore.append('\n')
		else:
		  myResult_ICP=myICP_Consecutive_MakeEmpty(myQualifiedTopicName)
		  if len(myResult_ICP[gnuCmdIdx_ORIGINAL])>0:
		    myGnuCmdCore.append(myResult_ICP[gnuCmdIdx_ORIGINAL])
		    myGnuCmdCore.append('\n')
		    myGnuCmdCoreLine1.append(myResult_ICP[gnuCmdIdx_ORIGINAL])
		    myGnuCmdCoreLine1.append('\n')
		myICP_PreviousDataSet[i]=myLocalLL[i][myStartStep]
		myFoundAnyPointImage=True
		#print len(myGnuPlotOutput)
	      else:
		#this topic does not have hits, just put empty
		if len(myResult_ICP[gnuCmdIdx_ORIGINAL])>0:
		  myGnuCmdCore.append(myResult_ICP[gnuCmdIdx_ORIGINAL])
		  myGnuCmdCore.append('\n')
		  myGnuCmdCoreLine1.append(myResult_ICP[gnuCmdIdx_ORIGINAL])
		  myGnuCmdCoreLine1.append('\n')
		  
	      myGnuPlotOutput+=myGnuCmdInitLine1
	      myGnuPlotOutput+=myGnuCmdCoreLine1
	      myGnuPlotOutput2+=myGnuCmdInitLine2
	      myGnuPlotOutput2+=myGnuCmdCore
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

