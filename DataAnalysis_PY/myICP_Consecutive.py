import math
import os
import datetime
myGnuPlotCmds=[]
myDebug=False
mySubtractThreshhold=0.3
myZoom=0.3
myMinX=-1.3
myMaxX=0
myMinY=0
myMaxY=1

def myOutput(vMessage):
  myGnuPlotCmds.append(vMessage)

def myCreateDatFile(dataSeriesRaw,vFileName,vTranslateX,vTranslateY,vRotate):
  global myDebug
  #myTargetFilename='dat/output_'+vFileName+'.dat'
  if myDebug:print "myCreateDatFile : ["+vFileName+"] Translate X "+str(vTranslateX)+" translate Y "+str(vTranslateY)+" rotate Z "+str(vRotate)
  f = open(vFileName, 'w')
  for i in range(1,len(dataSeriesRaw),2):
    #checking point angle and range
    myX=math.cos(math.radians(float(dataSeriesRaw[i])/2+vRotate))*float(dataSeriesRaw[i+1])+vTranslateX
    myY=math.sin(math.radians(float(dataSeriesRaw[i])/2+vRotate))*float(dataSeriesRaw[i+1])+vTranslateY
    #if myDebug:print "Angle "+str(float(dataSeriesRaw[i])/2)+" range "+str(dataSeriesRaw[i+1])+"=> X ["+str(myX)+"] Y ["+str(myY)+"]"
    f.write(str(myX)+" "+str(myY)+"\n")
  f.close()
def myGetCentroid(dataSeriesRaw):
  myResult=[]
  myXSum=0
  myYSum=0
  myElements=0
  for i in range(1,len(dataSeriesRaw),2):
    myElements=myElements+1
    myX=math.cos(math.radians(float(dataSeriesRaw[i])/2))*float(dataSeriesRaw[i+1])
    myY=math.sin(math.radians(float(dataSeriesRaw[i])/2))*float(dataSeriesRaw[i+1])
    myXSum=myXSum+myX
    myYSum=myYSum+myY
  if myElements>0:  
    myResult.append(myXSum/myElements)
    myResult.append(myYSum/myElements)
  else:
    myResult.append(0)
    myResult.append(0)
  return myResult
def mySubtractBackground(dataSeriesRaw,dataSeriesBackGround):
  myDataSeriesSubtracted=[]
  myDataSeriesSubtracted.append(dataSeriesRaw[0])
  for i in range(1,len(dataSeriesRaw),2):
    if math.fabs(float(dataSeriesBackGround[i+1])-float(dataSeriesRaw[i+1]))>mySubtractThreshhold:
      myDataSeriesSubtracted.append(dataSeriesRaw[i])
      myDataSeriesSubtracted.append(dataSeriesRaw[i+1])
  return myDataSeriesSubtracted
def myFilterRange(dataSeriesRaw):
  myDataSeriesSubtracted=[]
  myDataSeriesSubtracted.append(dataSeriesRaw[0])
  #print "myFilterRange"

  for i in range(1,len(dataSeriesRaw),2):
    myX=math.cos(math.radians(float(dataSeriesRaw[i])/2))*float(dataSeriesRaw[i+1])
    myY=math.sin(math.radians(float(dataSeriesRaw[i])/2))*float(dataSeriesRaw[i+1])
    if (myX>myMinX and myX<myMaxX and myY>myMinY and myY<myMaxY):
      #print "Writing "+str(myX)+" "+str(myY)
      myDataSeriesSubtracted.append(dataSeriesRaw[i])
      myDataSeriesSubtracted.append(dataSeriesRaw[i+1])
  return myDataSeriesSubtracted
def myApplyICP(dataSeriesRaw,dataSeriesPrevious,vIterations):
  myDebug=True
  #Make an initial pass to calculate the points
  myMatchedOriginal=[]
  myMatchedPrevious=[]
  for i in range(1,len(dataSeriesRaw),2):
    myX=math.cos(math.radians(float(dataSeriesRaw[i])/2))*float(dataSeriesRaw[i+1])
    myY=math.sin(math.radians(float(dataSeriesRaw[i])/2))*float(dataSeriesRaw[i+1])
    myMatchedOriginal.append(myX)
    myMatchedOriginal.append(myY)

  for j in range(1,len(dataSeriesPrevious),2):
    myXPrev=math.cos(math.radians(float(dataSeriesPrevious[j])/2))*float(dataSeriesPrevious[j+1])
    myYPrev=math.sin(math.radians(float(dataSeriesPrevious[j])/2))*float(dataSeriesPrevious[j+1])
    myMatchedPrevious.append(myXPrev)
    myMatchedPrevious.append(myYPrev)

    
  
  #Algorithm is prepared with list of cartesian points in myMatchedOriginal and myMatchedPrevious
  myTranslationX=0	#result 
  myTranslationY=0	#result
  myTheta=0	#result
  myDeltaTranslationX=0
  myDeltaTranslationY=0
  myDeltaTranslationTheta=0
  if myDebug:print "Have "+str(len(myMatchedPrevious))+" elements in myMatchedPrevious"
  if len(myMatchedPrevious)>0:
    for k in range(0,vIterations):
      print "Doing iteration "+str(k)
      myNewMatchedOrig=[]
      myNewMatchedPrev=[]
      myCurrentPrevious=[]
      #At each iteration apply current results on previous points
      #Calculate centroid
      myXPrevSum=0
      myYPrevSum=0
      myPointsNr=0
      for j in range(0,len(myMatchedPrevious),2):
	myXPrevSum+=myMatchedPrevious[j]
	myYPrevSum+=myMatchedPrevious[j+1]
	myPointsNr+=1
      myCentroidX=myXPrevSum/myPointsNr
      myCentroidY=myYPrevSum/myPointsNr
      print "Did centroid on "+str(myPointsNr)+" points"
      myCosine=math.cos(math.radians(myDeltaTranslationTheta))
      mySine=math.sin(math.radians(myDeltaTranslationTheta))
      print "Theta: ["+str(myDeltaTranslationTheta)+"] deg. Sine: ["+str(mySine)+"].Cosine: ["+str(myCosine)+"]"
      #Apply rotation of previous points around centroid
      #for j in range(0,len(myMatchedPrevious),2)
	#myXPrev=math.cos(math.radians(myDeltaTranslationTheta))*myMatchedPrevious(j)+myDeltaTranslationX
	#myYPrev=myMatchedPrevious(j)+myDeltaTranslationY
      #Make matching
      for i in range(0,len(myMatchedOriginal),2):
	myDist=0.05
	myX=myMatchedOriginal[i]
	myY=myMatchedOriginal[i+1]
	myFound=False
	for j in range(0,len(myMatchedPrevious),2):
	  myPrevX=myMatchedPrevious[j]
	  myPrevY=myMatchedPrevious[j+1]
	  myCartesianDistance=math.sqrt((myX-myXPrev)*(myX-myXPrev)+(myY-myYPrev)*(myY-myYPrev))
	  if myCartesianDistance<myDist:
	    myDist=myCartesianDistance
	    myLastXPrev=myXPrev
	    myLastYPrev=myYPrev
	    myFound=True
	  if myFound:
	    myNewMatchedOrig.append(myXPrev)
	    myNewMatchedOrig.append(myYPrev)
	    myNewMatchedPrev.append(myXPrev)
	    myNewMatchedPrev.append(myYPrev)
  
  #for i in range(1,len(dataSeriesRaw),2):
    #myDist=0.05
    #myX=math.cos(math.radians(float(dataSeriesRaw[i])/2))*float(dataSeriesRaw[i+1])
    #myY=math.sin(math.radians(float(dataSeriesRaw[i])/2))*float(dataSeriesRaw[i+1])
    #myLastXPrev=10000
    #myLastYPrev=10000
    #myFound=False
    #for j in range(1,len(dataSeriesPrevious),2):
      #myXPrev=math.cos(math.radians(float(dataSeriesPrevious[j])/2))*float(dataSeriesPrevious[j+1])
      #myYPrev=math.sin(math.radians(float(dataSeriesPrevious[j])/2))*float(dataSeriesPrevious[j+1])
      ##calculate cartesian distance
      #myCartesianDistance=math.sqrt((myX-myXPrev)*(myX-myXPrev)+(myY-myYPrev)*(myY-myYPrev))
      #if myCartesianDistance<myDist:
	#myDist=myCartesianDistance
	#myLastXPrev=myXPrev
	#myLastYPrev=myYPrev
	#myFound=True
    #if myFound:
      #myMatchedOriginal.append(myX)
      #myMatchedOriginal.append(myY)
  myResult=[]
  myResult.append(myTranslationX)#X translation
  myResult.append(myTranslationY)#Y translation
  myResult.append(myTheta)#rotation
  return myResult
def myCreateDatFileICP(dataSeriesRaw,vFileName,vTranslateX,vTranslateY,vRotate,dataSeriesPrevious):
  global myDebug
  #myTargetFilename='dat/output_'+vFileName+'.dat'
  if myDebug:print "myCreateDatFileSample : ["+vFileName+"] Translate X "+str(vTranslateX)+" translate Y "+str(vTranslateY)+" rotate Z "+str(vRotate)
  f = open(vFileName, 'w')
  #myResult=[]
  #myResult.append("")#X translation
  
  for i in range(1,len(dataSeriesRaw),2):
    myDist=0.05
    myX=math.cos(math.radians(float(dataSeriesRaw[i])/2))*float(dataSeriesRaw[i+1])
    myY=math.sin(math.radians(float(dataSeriesRaw[i])/2))*float(dataSeriesRaw[i+1])
    myLastXPrev=10000
    myLastYPrev=10000
    myFound=False
    for j in range(1,len(dataSeriesPrevious),2):
      myXPrev=math.cos(math.radians(float(dataSeriesPrevious[j])/2))*float(dataSeriesPrevious[j+1])
      myYPrev=math.sin(math.radians(float(dataSeriesPrevious[j])/2))*float(dataSeriesPrevious[j+1])
      #calculate cartesian distance
      myCartesianDistance=math.sqrt((myX-myXPrev)*(myX-myXPrev)+(myY-myYPrev)*(myY-myYPrev))
      if myCartesianDistance<myDist:
	myDist=myCartesianDistance
	myLastXPrev=myXPrev
	myLastYPrev=myYPrev
	myFound=True
    if myFound:
      f.write(str(myX)+" "+str(myY)+"\n"+str(myLastXPrev)+" "+str(myLastYPrev)+"\n\n")
  f.close()
def myCreateDatFileLineFit(dataSeriesRaw,vFileName,vTranslateX,vTranslateY,vRotate,dataSeriesPrevious):
  global myDebug
  #myTargetFilename='dat/output_'+vFileName+'.dat'
  #if myDebug:
  #print "myCreateDatFileLineFit : ["+vFileName+"] Translate X "+str(vTranslateX)+" translate Y "+str(vTranslateY)+" rotate Z "+str(vRotate)
  f = open(vFileName, 'w')
  myLinePoints=[]
  myLineFits=[]
  myLineAngleShift=-1000
  myIntegrator=0
  myIntegrateBuffer=4
  mySumX=0
  mySumY=0
  myDataReady=False
  for i in range(1,len(dataSeriesRaw),2):
    #Calculate actual coordinates
    myX=math.cos(math.radians(float(dataSeriesRaw[i])/2))*float(dataSeriesRaw[i+1])
    myY=math.sin(math.radians(float(dataSeriesRaw[i])/2))*float(dataSeriesRaw[i+1])
    mySumX=mySumX+myX
    mySumY=mySumY+myY
    myIntegrator=myIntegrator+1
    if (myIntegrator==myIntegrateBuffer) or (i==len(dataSeriesRaw)-2):
      myX=mySumX/myIntegrator
      myY=mySumY/myIntegrator
      mySumX=0
      mySumY=0
      myIntegrator=0
      myDoAngle=True
    else:
      myDoAngle=False
    #Check if line is part of regression pattern
    if myDoAngle:
      if myDataReady:
	myAngleShift=math.degrees(math.atan2(-(myY-myYPrev),(myX-myXPrev)))
	if myLineAngleShift==-1000:
	  myLineAngleShift=myAngleShift
	myDiff=math.fabs(myLineAngleShift-myAngleShift)
	#print "Angle shift:" + str(myAngleShift) + " Line angle shift: " + str(myLineAngleShift) + " Difference: " + str(myDiff)
	if (myDiff>60) or (i==len(dataSeriesRaw)-2):
	  #if i==len(dataSeriesRaw)-2:
	  #  print "Data series end"
	  myLineFits.append(myLinePoints[0])
	  myLineFits.append(myLinePoints[1])
	  myLineFits.append(myLinePoints[len(myLinePoints)-2])
	  myLineFits.append(myLinePoints[len(myLinePoints)-1])
	  myLinePoints=[]
	  myLineAngleShift=-1000
	  #print "Line ended"
      myLinePoints.append(myX)
      myLinePoints.append(myY)
      #Save for next iteration
      myXPrev=myX
      myYPrev=myY
      myDataReady=True
    #i=i+6 
  #print "Line fits:"+str(len(myLineFits)/4)
  for j in range(0,len(myLineFits),4):
    f.write(str(myLineFits[j])+" "+str(myLineFits[j+1])+"\n"+str(myLineFits[j+2])+" "+str(myLineFits[j+3])+"\n\n")
  f.close()
  #if len(myLineFits)/4==2:
  return myLineFits

def myCreateDatFileBoxRectangle(vLineFits,vFileName):
  myLineFitCenter=[]
  f = open(vFileName, 'w')
  #Check which two points are closest=>corner
  myMaxDistance=10000
  #vLineFits[0]=x1
  #vLineFits[1]=y1
  #vLineFits[2]=x2
  #vLineFits[3]=y2
  #vLineFits[4]=xp1
  #vLineFits[5]=yp1
  #vLineFits[6]=xp2
  #vLineFits[7]=yp2
  for i in range(0,2,1):
    for j in range(0,2,1):
      #myTargetX=
      #print "Targets:"+str()
      myCartesianDistance=math.sqrt(math.pow(vLineFits[i*2]-vLineFits[j*2+4],2)+math.pow(vLineFits[i*2+1]-vLineFits[j*2+5],2))
      if myCartesianDistance<myMaxDistance:
	myI=i
	myJ=j
	myMaxDistance=myCartesianDistance
      #print "My indexes: "+str(i)+" "+str(j)+" have distance: "+str(myCartesianDistance)
  i=myI
  j=myJ
  myLineFitCenterX=(vLineFits[i*2]+vLineFits[j*2+4])/2
  myLineFitCenterY=(vLineFits[i*2+1]+vLineFits[j*2+5])/2
  myLineFitFarCornerX=(vLineFits[(1-i)*2]+vLineFits[(1-j)*2+4])/2
  myLineFitFarCornerY=(vLineFits[(1-i)*2+1]+vLineFits[(1-j)*2+5])/2
  x1=myLineFitCenterX
  y1=myLineFitCenterY
  x2=myLineFitFarCornerX
  y2=myLineFitFarCornerY
  a=(y2-y1)/(x2-x1)
  b=y1-a*x1
  d=0.5
  exp1=-2*x1+2*a*(b-y1)
  exp11=4*(1+a*a)
  exp2=exp11*(y1*y1-d*d)
  myDelta=math.fabs(exp1*exp1-exp2)
  #print "Delta: "+str(myDelta)
  xm1=(-(-2*x1+2*a*(b-y1))+math.sqrt(myDelta))/(2*(1+a*a))
  ym1=a*xm1+b
  #print "Corner indexes: "+str(i)+" "+str(j)
  #print "Opposite corner indexes: "+str(1-i)+" "+str(1-j)
  f.write(str(myLineFitCenterX)+" "+str(myLineFitCenterY)+"\n")
  f.write(str(myLineFitFarCornerX)+" "+str(myLineFitFarCornerY)+"\n")
  #determine line of other corner from average of other two points
  
  myLineFitCenter.append((myLineFitCenterX+myLineFitFarCornerX)/2)
  myLineFitCenter.append((myLineFitCenterY+myLineFitFarCornerY)/2)
  #myLineFitCenter.append(xm1)
  #myLineFitCenter.append(ym1)
  
  return myLineFitCenter
  f.close()
def myCreateDatFileCentroid(vFileName,vLocalFileName,vCentroid):
  global myDebug
  #myTargetFilename='dat/output_'+vFileName+'.dat'
  if myDebug:print "myCreateDatFileCentroid : ["+vFileName+"]"
  if os.path.isfile(vFileName):
    f = open(vFileName, 'r')
    g = open(vLocalFileName, 'w')
    lines = f.readlines()
    for line in lines:
      g.write(line)
    f.close()
  else:
    g = open(vLocalFileName, 'w')
  #Append last information
  if (vCentroid[0]!=0 or vCentroid[1]!=0):
    f = open(vFileName, 'a')
    f.write(str(vCentroid[0])+" "+str(vCentroid[1])+"\n")
    g.write(str(vCentroid[0])+" "+str(vCentroid[1])+"\n")
    f.close()
    g.close()
def myCreateDatFileICP_TRAJ(vFileName,vLocalFileName,vCentroid):
  global myDebug
  #myTargetFilename='dat/output_'+vFileName+'.dat'
  if myDebug:print "myCreateDatFileICP_TRAJ : ["+vFileName+"]"
  if os.path.isfile(vFileName):
    f = open(vFileName, 'r')
    g = open(vLocalFileName, 'w')
    lines = f.readlines()
    for line in lines:
      g.write(line)
    f.close()
  else:
    g = open(vLocalFileName, 'w')
  #Append last information
  if (vCentroid[0]!=0 or vCentroid[1]!=0):
    f = open(vFileName, 'a')
    f.write(str(vCentroid[0])+" "+str(vCentroid[1])+"\n")
    g.write(str(vCentroid[0])+" "+str(vCentroid[1])+"\n")
    f.close()
    g.close()
def myCreateDatFileKalman_TRAJ(vFileName,vLocalFileName,vCentroid):
  global myDebug
  #myTargetFilename='dat/output_'+vFileName+'.dat'
  if myDebug:print "myCreateDatFileKalman_TRAJ : ["+vFileName+"]"
  if os.path.isfile(vFileName):
    f = open(vFileName, 'r')
    g = open(vLocalFileName, 'w')
    lines = f.readlines()
    for line in lines:
      g.write(line)
    f.close()
  else:
    g = open(vLocalFileName, 'w')
  #Append last information
  if (vCentroid[0]!=0 or vCentroid[1]!=0):
    f = open(vFileName, 'a')
    f.write(str(vCentroid[0])+" "+str(vCentroid[1])+"\n")
    g.write(str(vCentroid[0])+" "+str(vCentroid[1])+"\n")
    f.close()
    g.close()    
def myCreateDatFileTrajectoryLineFits(vFileName,vLocalFileName,vLineFitCenter):
  global myDebug
  #myTargetFilename='dat/output_'+vFileName+'.dat'
  if myDebug:print "myCreateDatFileTrajectoryLineFits : ["+vFileName+"]"
  if os.path.isfile(vFileName):
    f = open(vFileName, 'r')
    g = open(vLocalFileName, 'w')
    lines = f.readlines()
    for line in lines:
      g.write(line)
    f.close()
  else:
    g = open(vLocalFileName, 'w')
  #Append last information
  #Calculate corner and outer points indexes
  if (vLineFitCenter[0]!=0 or vLineFitCenter[1]!=0):
    f = open(vFileName, 'a')
    f.write(str(vLineFitCenter[0])+" "+str(vLineFitCenter[1])+"\n")
    g.write(str(vLineFitCenter[0])+" "+str(vLineFitCenter[1])+"\n")
    f.close()
    g.close()
def myCreateDatFileTrajectoryNoLineFits(vFileName,vLocalFileName):
  global myDebug
  #myTargetFilename='dat/output_'+vFileName+'.dat'
  if myDebug:print "myCreateDatFileTrajectoryLineFits : ["+vFileName+"]"
  if os.path.isfile(vFileName):
    f = open(vFileName, 'r')
    g = open(vLocalFileName, 'w')
    lines = f.readlines()
    for line in lines:
      g.write(line)
    f.close()
    g.close()
  else:
    g = open(vLocalFileName, 'w')
    g.close()
def myCreateDatFileSample(dataSeriesRaw,vFileName,vTranslateX,vTranslateY,vRotate,dataSeriesBackGround):
  global myDebug
  #myTargetFilename='dat/output_'+vFileName+'.dat'
  if myDebug:print "myCreateDatFileSample : ["+vFileName+"] Translate X "+str(vTranslateX)+" translate Y "+str(vTranslateY)+" rotate Z "+str(vRotate)
  f = open(vFileName, 'w')
  for i in range(1,len(dataSeriesRaw),2):
    if math.fabs(float(dataSeriesBackGround[i+1])-float(dataSeriesRaw[i+1]))>mySubtractThreshhold:
      #checking point angle and range
      myX=math.cos(math.radians(float(dataSeriesRaw[i])/2+vRotate))*float(dataSeriesRaw[i+1])+vTranslateX
      myY=math.sin(math.radians(float(dataSeriesRaw[i])/2+vRotate))*float(dataSeriesRaw[i+1])+vTranslateY
      #if myDebug:print "Angle "+str(float(dataSeriesRaw[i])/2)+" range "+str(dataSeriesRaw[i+1])+"=> X ["+str(myX)+"] Y ["+str(myY)+"]"
      f.write(str(myX)+" "+str(myY)+"\n")
  f.close()
def myICP_Consecutive(dataSeriesRaw,dataSeriesPrevious,vTopicName,vDateTime,vTopicPose,dataSeriesBackGround):
  myGnuPlotCmds=[]
  myDebug=False
  #make two passes, one with original coordinates, other with transformations
  #original
  myRotate=0#degrees rotate the robot angle, for plotting only
  myTranslateX=0.0
  myTranslateY=0.0
  myTargetFilename='dat/output_'+vTopicName[1:]+'_ICP.dat'
  if myDebug:print 'Target filename:'+myTargetFilename
  myCreateDatFile(dataSeriesRaw,myTargetFilename,myTranslateX,myTranslateY,myRotate)
  myGnuPlotCmds.append('plot "'+myTargetFilename+'" u 1:2 lt rgb "red" title "'+vTopicName[5:9]+'"')
  #rotated
  myTranslateX=float(vTopicPose[0])
  myTranslateY=float(vTopicPose[1])
  myRotate=float(vTopicPose[2])
  myTargetFilename='dat/output_'+vTopicName[1:]+'_ICP_mod.dat'
  myCreateDatFile(dataSeriesRaw,myTargetFilename,myTranslateX,myTranslateY,myRotate)
  myGnuPlotCmds.append('"'+myTargetFilename+'" u 1:2 title "'+vTopicName[5:9]+'",')
  #sample untranslated unrotated
  myRotate=0#degrees rotate the robot angle, for plotting only
  myTranslateX=0.0
  myTranslateY=0.0
  myTargetFilename='dat/output_'+vTopicName[1:]+'_ICP_sub.dat'
  dataSeriesSub1=mySubtractBackground(dataSeriesRaw,dataSeriesBackGround)
  dataSeriesSub=myFilterRange(dataSeriesSub1)
  dataSeriesPrevSub1=mySubtractBackground(dataSeriesPrevious,dataSeriesBackGround)
  dataSeriesPrevSub=myFilterRange(dataSeriesPrevSub1)
  myCreateDatFile(dataSeriesSub,myTargetFilename,myTranslateX,myTranslateY,myRotate)
  #2
  myGnuPlotCmds.append('plot "'+myTargetFilename+'" u 1:2 lt rgb "red" title "'+vTopicName[5:9]+'"')
  #Zoom in data range
  myCentroid=myGetCentroid(dataSeriesSub)
  myGnuPlotCmds.append('set xrange ['+str(myCentroid[0]-myZoom)+':'+str(myCentroid[0]+myZoom)+']')
  myGnuPlotCmds.append('set yrange ['+str(myCentroid[1]-myZoom)+':'+str(myCentroid[1]+myZoom)+']')
  #3 actual position
  myGnuPlotCmds.append('plot "'+myTargetFilename+'" u 1:2 lt rgb "red" title "'+vTopicName[5:9]+' actual"')
  #previous sample, green
  myRotate=0#degrees rotate the robot angle, for plotting only
  myTranslateX=0.0
  myTranslateY=0.0
  myTargetFilename='dat/output_'+vTopicName[1:]+'_ICP_prev.dat'
  myCreateDatFileSample(dataSeriesPrevSub,myTargetFilename,myTranslateX,myTranslateY,myRotate,dataSeriesBackGround)
  #4
  myGnuPlotCmds.append('"'+myTargetFilename+'" u 1:2 lt rgb "green" title "previous"')
  #ICP iterations, blue
  myRotate=0#degrees rotate the robot angle, for plotting only
  myTranslateX=0.0
  myTranslateY=0.0
  myTargetFilename='dat/output_'+vTopicName[1:]+'_ICP_iterations.dat'
  myCreateDatFileICP(dataSeriesSub,myTargetFilename,myTranslateX,myTranslateY,myRotate,dataSeriesPrevSub)
  myICP_Centroid=myApplyICP(dataSeriesSub,dataSeriesPrevSub,3)
  print "myICP center has "+str(len(myICP_Centroid))
  #5
  myGnuPlotCmds.append('"'+myTargetFilename+'" lt rgb "blue" title "matches" with line')
  #centroid
  myRotate=0#degrees rotate the robot angle, for plotting only
  myTranslateX=0.0
  myTranslateY=0.0
  myCentroidTargetFilename='dat/output_'+vTopicName[5:9]+'_ICP_centroid.dat'
  myTargetFilename='dat/output_'+vTopicName[1:]+'_ICP_centroid.dat'
  myCreateDatFileCentroid(myCentroidTargetFilename,myTargetFilename,myCentroid)
  #6
  myGnuPlotCmds.append('"'+myTargetFilename+'" lt rgb "cyan" linewidth 3 title "centroid" with line')
  #---------------------------------------------------------------------------------------------------------------------
  #line fit
  myRotate=0#degrees rotate the robot angle, for plotting only
  myTranslateX=0.0
  myTranslateY=0.0
  myTargetFilename='dat/output_'+vTopicName[1:]+'_ICP_line_fit.dat'
  myLineFits=myCreateDatFileLineFit(dataSeriesSub,myTargetFilename,myTranslateX,myTranslateY,myRotate,dataSeriesPrevSub)
  if len(myLineFits)/4==2:
    myGnuPlotCmds.append('"'+myTargetFilename+'" lt rgb "magenta" linewidth 3 title "line fit" with line')
  else:
    myGnuPlotCmds.append('"'+myTargetFilename+'" lt rgb "magenta" linewidth 3 title "line fit" with line')
  #---------------------------------------------------------------------------------------------------------------------
  if len(myLineFits)/4==2:
    #box rectangle
    myRotate=0#degrees rotate the robot angle, for plotting only
    myTranslateX=0.0
    myTranslateY=0.0
    myLineFitTrajFilename='dat/output_'+vTopicName[5:9]+'_ICP_line_fit_rect.dat'
    myTargetFilename='dat/output_'+vTopicName[1:]+'_ICP_line_fit_rect.dat'
    myLineFitCenter=myCreateDatFileBoxRectangle(myLineFits,myTargetFilename)
    myGnuPlotCmds.append('"'+myTargetFilename+'" lt rgb "black" linewidth 3 title "box"')
    #trajectory of box center
    myRotate=0#degrees rotate the robot angle, for plotting only
    myTranslateX=0.0
    myTranslateY=0.0
    myLineFitTrajFilename='dat/output_'+vTopicName[5:9]+'_ICP_line_fit_traj.dat'
    myTargetFilename='dat/output_'+vTopicName[1:]+'_ICP_line_fit_traj.dat'
    myCreateDatFileTrajectoryLineFits(myLineFitTrajFilename,myTargetFilename,myLineFitCenter)
    myGnuPlotCmds.append('"'+myTargetFilename+'" lt rgb "green" linewidth 3 title "box center" with line')
  else:
    myGnuPlotCmds.append('')
    #for box center trajectory keep existing points
    myLineFitTrajFilename='dat/output_'+vTopicName[5:9]+'_ICP_line_fit_traj.dat'
    myTargetFilename='dat/output_'+vTopicName[1:]+'_ICP_line_fit_traj.dat'
    myCreateDatFileTrajectoryNoLineFits(myLineFitTrajFilename,myTargetFilename)
    myGnuPlotCmds.append('"'+myTargetFilename+'" lt rgb "green" linewidth 3 title "box center" with line')
  #if myDebug:
  #print "myICP_Consecutive has "+str(len(myGnuPlotCmds))+" elements"
  #ICP trajectory
  myICP_TRAJ_TargetFilename='dat/output_'+vTopicName[5:9]+'_ICP_trajectory.dat'
  myTargetFilename='dat/output_'+vTopicName[1:]+'_ICP_trajectory_local.dat'
  myICP_Centroid=[]
  if myCentroid[0]!=0:
    myICP_Centroid.append(myCentroid[0]+0.05)
    myICP_Centroid.append(myCentroid[1]+0.05)
  else:
    myICP_Centroid.append(0)
    myICP_Centroid.append(0)
  myCreateDatFileICP_TRAJ(myICP_TRAJ_TargetFilename,myTargetFilename,myICP_Centroid)
  myGnuPlotCmds.append('"'+myTargetFilename+'" lt rgb "#0000AA" linewidth 3 title "ICP center" with line')
  #Kalman trajectory
  myICP_KALMAN_TargetFilename='dat/output_'+vTopicName[5:9]+'_ICP_kalman_trajectory.dat'
  myTargetFilename='dat/output_'+vTopicName[1:]+'_ICP_kalman_trajectory_local.dat'
  myKalman_Result=[]
  if myCentroid[0]!=0:
    myKalman_Result.append(myCentroid[0]-0.05)
    myKalman_Result.append(myCentroid[1]-0.05)
  else:
    myKalman_Result.append(0)
    myKalman_Result.append(0)
  myCreateDatFileKalman_TRAJ(myICP_KALMAN_TargetFilename,myTargetFilename,myKalman_Result)
  myGnuPlotCmds.append('"'+myTargetFilename+'" lt rgb "#00AAAA" linewidth 3 title "Kalman output" with line')
  return myGnuPlotCmds
  
def myICP_Consecutive_MakeEmpty(vTopicName):
  myGnuPlotCmds=[]
  myTargetFilename='dat/output_'+vTopicName[1:]+'_ICP.dat'
  f = open(myTargetFilename, 'w')
  f.write("0 0\n")
  f.close()
  myGnuPlotCmds.append('plot "'+myTargetFilename+'" u 1:2 title "'+vTopicName[5:9]+'"')
  myTargetFilename='dat/output_'+vTopicName[1:]+'_ICP_mod.dat'
  f = open(myTargetFilename, 'w')
  f.write("0 0\n")
  f.close()
  myGnuPlotCmds.append('"'+myTargetFilename+'" u 1:2 title "'+vTopicName[5:9]+'"')
  return myGnuPlotCmds
  