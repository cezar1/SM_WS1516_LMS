import math
import os
import datetime
myGnuPlotCmds=[]
myDebug=False
mySubtractThreshhold=0.3
myZoom=0.2
myMinX=-1.3
myMaxX=0
myMinY=0
myMaxY=1
cPoseVectorLength=0.25

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
def myCreateDatFileICP_Vector(vVector,vFileName):
  myVector=[]
  myVector.append(vVector[0])#X origin
  myVector.append(vVector[1])#Y origin
  myVector.append(vVector[2])#theta
  myVector.append(vVector[3])#length
  f = open(vFileName, 'w')
  #calculate end point from theta and length
  myEndPoint=[]
  myEndPoint.append(myVector[0]+myVector[3]*math.cos(math.radians(myVector[2])))
  myEndPoint.append(myVector[1]+myVector[3]*math.sin(math.radians(myVector[2])))
  if myVector[0]!=0 and myVector[1]!=0:
    f.write(str(myVector[0])+" "+str(myVector[1])+"\n"+str(myEndPoint[0])+" "+str(myEndPoint[1]))
  f.close()
def myCreateDatFileBox_Vector(vVector,vFileName):
  myVector=[]
  myVector.append(vVector[0])#X origin
  myVector.append(vVector[1])#Y origin
  myVector.append(vVector[2])#theta
  myVector.append(vVector[3])#length
  f = open(vFileName, 'w')
  #calculate end point from theta and length
  myEndPoint=[]
  myEndPoint.append(myVector[0]+myVector[3]*math.cos(math.radians(myVector[2])))
  myEndPoint.append(myVector[1]+myVector[3]*math.sin(math.radians(myVector[2])))
  if myVector[0]!=0 and myVector[1]!=0:
    f.write(str(myVector[0])+" "+str(myVector[1])+"\n"+str(myEndPoint[0])+" "+str(myEndPoint[1]))
  f.close()
def myApplyICP(dataSeriesRaw,dataSeriesPrevious,vIterations,vFileName):
  myDebug=False
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
  myOmega=0
  f = open(vFileName, 'w')
  if myDebug:print "Have "+str(len(myMatchedPrevious))+" elements in myMatchedPrevious"
  if len(myMatchedPrevious)>0 and len(myMatchedOriginal)>0:
    for k in range(0,vIterations):
      #print "Doing iteration ["+str(k+1)+"]."
      myNewMatchedOrig=[]
      myNewMatchedPrev=[]
      myCurrentPrevious=[]
      #At each iteration apply current results on previous points
      #Calculate centroid
      myXPrevSum=0
      myYPrevSum=0
      myPointsNr=0
      for j in range(0,len(myMatchedOriginal),2):
	myXPrevSum+=myMatchedOriginal[j]
	myYPrevSum+=myMatchedOriginal[j+1]
	myPointsNr+=1
      myCentroidOrigX=myXPrevSum/myPointsNr
      myCentroidOrigY=myYPrevSum/myPointsNr
      #print "Did centroid on original "+str(myPointsNr)+" points"
      myXPrevSum=0
      myYPrevSum=0
      myPointsNr=0
      for j in range(0,len(myMatchedPrevious),2):
	myXPrevSum+=myMatchedPrevious[j]
	myYPrevSum+=myMatchedPrevious[j+1]
	myPointsNr+=1
      myCentroidX=myXPrevSum/myPointsNr
      myCentroidY=myYPrevSum/myPointsNr
      #print "Did centroid on previous "+str(myPointsNr)+" points"
      #print "I ["+str(k+1)+"]. Orig ["+str(myCentroidOrigX)+"]["+str(myCentroidOrigY)+"]. Prev1 ["+str(myCentroidX)+"]["+str(myCentroidY)+"]. Delta ["+str(myCentroidOrigX-myCentroidX)+"]["+str(myCentroidOrigY-myCentroidY)+"]"
      myCosine=math.cos(math.radians(myDeltaTranslationTheta))
      mySine=math.sin(math.radians(myDeltaTranslationTheta))
      #print "Theta: ["+str(myTheta)+"] deg. TX: ["+str(myTranslationX)+"].TY: ["+str(myTranslationY)+"]"
      myCurrentPrevious=[]
      #Apply rotation of previous points around centroid
      for j in range(0,len(myMatchedPrevious),2):
	#1.apply translation to origin
	myXPrevCurrent=myMatchedPrevious[j]#-myCentroidX
	myYPrevCurrent=myMatchedPrevious[j+1]#-myCentroidY
	#2.rotate in origin
	myXPrevCurrent2=math.cos(math.radians(myTheta))*myXPrevCurrent-math.sin(math.radians(myTheta))*myYPrevCurrent
	myYPrevCurrent2=+math.sin(math.radians(myTheta))*myXPrevCurrent+math.cos(math.radians(myTheta))*myYPrevCurrent
	#3.reapply translation to pivot point
	myXPrevCurrent=myXPrevCurrent2#+myCentroidX
	myYPrevCurrent=myYPrevCurrent2#+myCentroidY
	#4.apply translation from previous step
	myXPrevCurrent=myXPrevCurrent+myTranslationX#math.cos(math.radians(myDeltaTranslationTheta))*myMatchedPrevious(j)+myDeltaTranslationX
	myYPrevCurrent=myYPrevCurrent+myTranslationY#myMatchedPrevious(j)+myDeltaTranslationY
	myCurrentPrevious.append(myXPrevCurrent)
	myCurrentPrevious.append(myYPrevCurrent)
      myXPrevSum=0
      myYPrevSum=0
      myPointsNr=0
      for j in range(0,len(myCurrentPrevious),2):
	myXPrevSum+=myCurrentPrevious[j]
	myYPrevSum+=myCurrentPrevious[j+1]
	myPointsNr+=1
      myCentroidPrev2X=myXPrevSum/myPointsNr
      myCentroidPrev2Y=myYPrevSum/myPointsNr
      #print "Did centroid on previous "+str(myPointsNr)+" points, after applying partial T&R"
      #print "I ["+str(k+1)+"]. Orig ["+str(myCentroidOrigX)+"]["+str(myCentroidOrigY)+"]. Prev2 ["+str(myCentroidPrev2X)+"]["+str(myCentroidPrev2Y)+"]. Delta ["+str(myCentroidOrigX-myCentroidPrev2X)+"]["+str(myCentroidOrigY-myCentroidPrev2Y)+"]"
      #Make matching
      for i in range(0,len(myMatchedOriginal),2):
	myDist=0.05
	myX=myMatchedOriginal[i]
	myY=myMatchedOriginal[i+1]
	myFound=False
	for j in range(0,len(myCurrentPrevious),2):
	  myPrevX=myCurrentPrevious[j]
	  myPrevY=myCurrentPrevious[j+1]
	  myCartesianDistance=math.sqrt((myX-myPrevX)*(myX-myPrevX)+(myY-myPrevY)*(myY-myPrevY))
	  if myCartesianDistance<myDist:
	    myDist=myCartesianDistance
	    myLastXPrev=myPrevX
	    myLastYPrev=myPrevY
	    myFound=True
	if myFound:
	  myNewMatchedOrig.append(myX)
	  myNewMatchedOrig.append(myY)
	  myNewMatchedPrev.append(myLastXPrev)
	  myNewMatchedPrev.append(myLastYPrev)
	    
      if len(myNewMatchedOrig)>0:
	myNewMatchedOrigSumX=0
	myNewMatchedOrigSumY=0
	myNewMatchedPrevSumX=0
	myNewMatchedPrevSumY=0
	#print "Iteration ["+str(k+1)+"]. Matched ["+str(len(myNewMatchedOrig)/2)+"] from ["+str(len(myMatchedOriginal)/2)+"] points. Ratio ["+str(len(myNewMatchedOrig)*100/len(myMatchedOriginal))+"%]"
	for i in range(0,len(myNewMatchedOrig),2):
	  myNewMatchedOrigSumX+=myNewMatchedOrig[i]
	  myNewMatchedOrigSumY+=myNewMatchedOrig[i+1]
	  myNewMatchedPrevSumX+=myNewMatchedPrev[i]
	  myNewMatchedPrevSumY+=myNewMatchedPrev[i+1]
	myMatchedPairs=len(myNewMatchedOrig)/2
	myNewMatchedOrigCentroidX=myNewMatchedOrigSumX/myMatchedPairs
	myNewMatchedOrigCentroidY=myNewMatchedOrigSumY/myMatchedPairs
	myNewMatchedPrevCentroidX=myNewMatchedPrevSumX/myMatchedPairs
	myNewMatchedPrevCentroidY=myNewMatchedPrevSumY/myMatchedPairs
	#print "Original matched centroid X ["+str(myNewMatchedOrigCentroidX)+"] Y["+str(myNewMatchedOrigCentroidY)+"]"
	#print "Previous matched centroid X ["+str(myNewMatchedPrevCentroidX)+"] Y["+str(myNewMatchedPrevCentroidY)+"]"
	#print "Delta centroid X ["+str(myNewMatchedPrevCentroidX-myNewMatchedOrigCentroidX)+"] Y ["+str(myNewMatchedPrevCentroidY-myNewMatchedOrigCentroidY)+"]"
	#Make actual ICP calculation of TX,TY,T_theta
	#First check if enough pairs are matched, otherwise abort calculation
	if myMatchedPairs<20:
	  myAbortICP=True
	else:
	  myAbortICP=False
	if not myAbortICP:
	  math.atan2(-(myY-myYPrev),(myX-myXPrev))
	  #xo - x original
	  #xp - x previous (updated each iteration)
	  #yo - y original
	  #yp - y previous (updated each iteration)
	  mySxoyp=0
	  mySyoxp=0
	  mySxoxp=0
	  mySyoyp=0
	  for i in range(0,len(myNewMatchedOrig),2):
	    mySxoxp+=(myNewMatchedOrig[i]-myNewMatchedOrigCentroidX)*(myNewMatchedPrev[i]-myNewMatchedPrevCentroidX)
	    mySxoyp+=(myNewMatchedOrig[i]-myNewMatchedOrigCentroidX)*(myNewMatchedPrev[i+1]-myNewMatchedPrevCentroidY)
	    mySyoxp+=(myNewMatchedOrig[i+1]-myNewMatchedOrigCentroidY)*(myNewMatchedPrev[i]-myNewMatchedPrevCentroidX)
	    mySyoyp+=(myNewMatchedOrig[i+1]-myNewMatchedOrigCentroidY)*(myNewMatchedPrev[i+1]-myNewMatchedPrevCentroidY)
	  myOmega=math.atan2(mySxoyp-mySyoxp,mySxoxp+mySyoyp)
	  myOmega=math.degrees(myOmega)#+90
	  myTheta=-myOmega
	  myTX=myNewMatchedPrevCentroidX-(myNewMatchedOrigCentroidX*math.cos(math.radians(myOmega))-myNewMatchedOrigCentroidY*math.sin(math.radians(myOmega)))
	  myTY=myNewMatchedPrevCentroidY-(myNewMatchedOrigCentroidX*math.sin(math.radians(myOmega))+myNewMatchedOrigCentroidY*math.cos(math.radians(myOmega)))
	  myTranslationX=-myTX
	  myTranslationY=-myTY
	  #print "Omega ["+str(myOmega)+"] deltaTX ["+str(myTX)+"] deltaTY ["+str(myTY)+"]"
	  #print "Theta ["+str(myTheta)+"] TX ["+str(myTranslationX)+"] TY ["+str(myTranslationY)+"]"
	  #For drawing only, at end of first iteration
	  if k==vIterations-1:
	    myCurrentPrevious=[]
	    #Apply rotation of previous points around centroid
	    #myTheta=90
	    #myTranslationX=0.05
	    #myTranslationY=0.05
	    for j in range(0,len(myNewMatchedOrig),2):
	      #1.apply translation to origin
	      myXPrevCurrent=myNewMatchedOrig[j]#-myNewMatchedOrigCentroidX
	      myYPrevCurrent=myNewMatchedOrig[j+1]#-myNewMatchedOrigCentroidY
	      #2.rotate in origin
	      myXPrevCurrent2=math.cos(math.radians(myTheta))*myXPrevCurrent-math.sin(math.radians(myTheta))*myYPrevCurrent
	      myYPrevCurrent2=math.sin(math.radians(myTheta))*myXPrevCurrent+math.cos(math.radians(myTheta))*myYPrevCurrent
	      #3.reapply translation to pivot point
	      #myXPrevCurrent=myXPrevCurrent2+myNewMatchedOrigCentroidX
	      #myYPrevCurrent=myYPrevCurrent2+myNewMatchedOrigCentroidY
	      #4.apply translation from previous step
	      myXPrevCurrent=myXPrevCurrent+myTranslationX#math.cos(math.radians(myDeltaTranslationTheta))*myMatchedPrevious(j)+myDeltaTranslationX
	      myYPrevCurrent=myYPrevCurrent+myTranslationY#myMatchedPrevious(j)+myDeltaTranslationY
	      myCurrentPrevious.append(myXPrevCurrent)
	      myCurrentPrevious.append(myYPrevCurrent)
	    #Draw myCurrentPrevious only for first iteration
	    for j in range(0,len(myNewMatchedOrig),2):
	      f.write(str(myNewMatchedOrig[j])+" "+str(myNewMatchedOrig[j+1])+"\n"+str(myCurrentPrevious[j])+" "+str(myCurrentPrevious[j+1])+"\n\n")
	  
	#else:
	  #print "ICP aborted due to not enough matches found on filename ["+str(vFileName)+"]."
	  #print "Theta ["+str(myTheta)+"] TX ["+str(myTranslationX)+"] TY ["+str(myTranslationY)+"]"
      else:
	#No matches found
	print "No matches found. Aborting"
	break
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
  f.close()
  myResult=[]
  if math.fabs(myTranslationX)>0.5 or math.fabs(myTranslationY)>0.5:
    print "EXCEED: Theta ["+str(myTheta)+"] TX ["+str(myTranslationX)+"] TY ["+str(myTranslationY)+"] vFileName ["+str(vFileName)+"]"
  myResult.append(myTranslationX)#X translation
  myResult.append(myTranslationY)#Y translation
  myResult.append(myTheta)#rotation
  #myResult.append(myNewMatchedOrigCentroidX)#pivot point X
  #myResult.append(myNewMatchedOrigCentroidY)#pivot point Y
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
  myLineFitCenter.append(myLineFitCenterX)
  myLineFitCenter.append(myLineFitCenterY)
  myAngle=math.atan2(myLineFitCenterY-myLineFitFarCornerY,myLineFitCenterX-myLineFitFarCornerX)
  myAngle=math.degrees(myAngle)+180
  myLineFitCenter.append(myAngle)
  #print "Box slope is ["+str(myAngle)+"]"
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
def myICP_Consecutive(dataSeriesRaw,dataSeriesPrevious,vTopicName,vDateTime,vTopicPose,dataSeriesBackGround,vICP_Pose,vICP_Initialized):
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
  #Initialize ICP pose to centroid
  if vICP_Pose[0]==0:
    vICP_Pose[0]=myCentroid[0]
  if vICP_Pose[1]==0:
    vICP_Pose[1]=myCentroid[1]
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
  #myCreateDatFileICP(dataSeriesSub,myTargetFilename,myTranslateX,myTranslateY,myRotate,dataSeriesPrevSub)
  myICP_Centroid=myApplyICP(dataSeriesSub,dataSeriesPrevSub,5,myTargetFilename)
	    
	    
  vICP_Pose[0]+=myICP_Centroid[0]
  vICP_Pose[1]+=myICP_Centroid[1]
  vICP_Pose[2]+=myICP_Centroid[2]
  #print "myICP center has "+str(len(myICP_Centroid))
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
  myBoxAvailable=len(myLineFits)/4==2
  #print myBoxAvailable
  if myBoxAvailable:
    myGnuPlotCmds.append('"'+myTargetFilename+'" lt rgb "magenta" linewidth 3 title "line fit" with line')
  else:
    myGnuPlotCmds.append('"'+myTargetFilename+'" lt rgb "magenta" linewidth 3 title "line fit" with line')
  #---------------------------------------------------------------------------------------------------------------------
  if myBoxAvailable:
    #box rectangle
    myRotate=0#degrees rotate the robot angle, for plotting only
    myTranslateX=0.0
    myTranslateY=0.0
    myLineFitTrajFilename='dat/output_'+vTopicName[5:9]+'_ICP_line_fit_rect.dat'
    myTargetFilename='dat/output_'+vTopicName[1:]+'_ICP_line_fit_rect.dat'
    myLineFitCenter=myCreateDatFileBoxRectangle(myLineFits,myTargetFilename)
    if vICP_Initialized[0]==0:
      vICP_Pose[2]=myLineFitCenter[4]
      vICP_Initialized[0]=1
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
    myICP_Centroid.append(vICP_Pose[0])
    myICP_Centroid.append(vICP_Pose[1])
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
  myGnuPlotCmds.append('"'+myTargetFilename+'" lt rgb "#994C00" linewidth 3 title "Kalman output" with line')
  
  #ICP result vector
  myTargetFilename='dat/output_'+vTopicName[1:]+'_ICP_vector.dat'
  myICP_Vector=[]
  if myCentroid[0]!=0:
    #vICP_Pose[0]+=0.05
    #vICP_Pose[1]+=0.05
    #vICP_Pose[2]+=10
    myICP_Vector.append(vICP_Pose[0])
    myICP_Vector.append(vICP_Pose[1])
    myICP_Vector.append(vICP_Pose[2])
    myICP_Vector.append(cPoseVectorLength)
  else:
    myICP_Vector.append(0)
    myICP_Vector.append(0)
    myICP_Vector.append(45)
    myICP_Vector.append(0.15)
  myCreateDatFileICP_Vector(myICP_Vector,myTargetFilename)
  myGnuPlotCmds.append('"'+myTargetFilename+'" lt rgb "#FF6666" linewidth 3 title "ICP pose" with line')
  
  #Box result vector
  myTargetFilename='dat/output_'+vTopicName[1:]+'_box_vector.dat'
  myBox_Vector=[]
  if myBoxAvailable:
    myBox_Vector.append(myLineFitCenter[2])
    myBox_Vector.append(myLineFitCenter[3])
    myBox_Vector.append(myLineFitCenter[4])
    myBox_Vector.append(cPoseVectorLength)
  else:
    myBox_Vector.append(0)
    myBox_Vector.append(0)
    myBox_Vector.append(0)
    myBox_Vector.append(0)
  myCreateDatFileBox_Vector(myBox_Vector,myTargetFilename)
  myGnuPlotCmds.append('"'+myTargetFilename+'" lt rgb "#3399FF" linewidth 3 title "BOX pose" with line')
  
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
  