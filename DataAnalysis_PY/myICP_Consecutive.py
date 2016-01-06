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
  
def myCreateDatFileICP(dataSeriesRaw,vFileName,vTranslateX,vTranslateY,vRotate,dataSeriesPrevious):
  global myDebug
  #myTargetFilename='dat/output_'+vFileName+'.dat'
  if myDebug:print "myCreateDatFileSample : ["+vFileName+"] Translate X "+str(vTranslateX)+" translate Y "+str(vTranslateY)+" rotate Z "+str(vRotate)
  f = open(vFileName, 'w')
  
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
  #print "Corner indexes: "+str(i)+" "+str(j)
  #print "Opposite corner indexes: "+str(1-i)+" "+str(1-j)
  f.write(str(myLineFitCenterX)+" "+str(myLineFitCenterY)+"\n")
  f.write(str(myLineFitFarCornerX)+" "+str(myLineFitFarCornerY)+"\n")
  #determine line of other corner from average of other two points
  
  myLineFitCenter.append((myLineFitCenterX+myLineFitFarCornerX)/2)
  myLineFitCenter.append((myLineFitCenterY+myLineFitFarCornerY)/2)
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
  myGnuPlotCmds.append('plot "'+myTargetFilename+'" u 1:2 lt rgb "red" title "'+vTopicName[5:9]+'"\n')
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
  myGnuPlotCmds.append('plot "'+myTargetFilename+'" u 1:2 lt rgb "red" title "'+vTopicName[5:9]+'"\n')
  #Zoom in data range
  myCentroid=myGetCentroid(dataSeriesSub)
  myGnuPlotCmds.append('set xrange ['+str(myCentroid[0]-myZoom)+':'+str(myCentroid[0]+myZoom)+']\n')
  myGnuPlotCmds.append('set yrange ['+str(myCentroid[1]-myZoom)+':'+str(myCentroid[1]+myZoom)+']\n')
  #3 actual position
  myGnuPlotCmds.append('plot "'+myTargetFilename+'" u 1:2 lt rgb "red" title "'+vTopicName[5:9]+' actual",')
  #previous sample, green
  myRotate=0#degrees rotate the robot angle, for plotting only
  myTranslateX=0.0
  myTranslateY=0.0
  myTargetFilename='dat/output_'+vTopicName[1:]+'_ICP_prev.dat'
  myCreateDatFileSample(dataSeriesPrevSub,myTargetFilename,myTranslateX,myTranslateY,myRotate,dataSeriesBackGround)
  #4
  myGnuPlotCmds.append('"'+myTargetFilename+'" u 1:2 lt rgb "green" title "previous",')
  #ICP iterations, blue
  myRotate=0#degrees rotate the robot angle, for plotting only
  myTranslateX=0.0
  myTranslateY=0.0
  myTargetFilename='dat/output_'+vTopicName[1:]+'_ICP_iterations.dat'
  myCreateDatFileICP(dataSeriesSub,myTargetFilename,myTranslateX,myTranslateY,myRotate,dataSeriesPrevSub)
  #5
  myGnuPlotCmds.append('"'+myTargetFilename+'" lt rgb "blue" title "matches" with line,')
  #centroid
  myRotate=0#degrees rotate the robot angle, for plotting only
  myTranslateX=0.0
  myTranslateY=0.0
  myCentroidTargetFilename='dat/output_'+vTopicName[5:9]+'_ICP_centroid.dat'
  myTargetFilename='dat/output_'+vTopicName[1:]+'_ICP_centroid.dat'
  myCreateDatFileCentroid(myCentroidTargetFilename,myTargetFilename,myCentroid)
  #6
  myGnuPlotCmds.append('"'+myTargetFilename+'" lt rgb "cyan" linewidth 3 title "centroid" with line,')
  #---------------------------------------------------------------------------------------------------------------------
  #line fit
  myRotate=0#degrees rotate the robot angle, for plotting only
  myTranslateX=0.0
  myTranslateY=0.0
  myTargetFilename='dat/output_'+vTopicName[1:]+'_ICP_line_fit.dat'
  myLineFits=myCreateDatFileLineFit(dataSeriesSub,myTargetFilename,myTranslateX,myTranslateY,myRotate,dataSeriesPrevSub)
  if len(myLineFits)/4==2:
    myGnuPlotCmds.append('"'+myTargetFilename+'" lt rgb "magenta" linewidth 3 title "line fit" with line,')
  else:
    myGnuPlotCmds.append('"'+myTargetFilename+'" lt rgb "magenta" linewidth 3 title "line fit" with line,')
  #---------------------------------------------------------------------------------------------------------------------
  if len(myLineFits)/4==2:
    #box rectangle
    myRotate=0#degrees rotate the robot angle, for plotting only
    myTranslateX=0.0
    myTranslateY=0.0
    myLineFitTrajFilename='dat/output_'+vTopicName[5:9]+'_ICP_line_fit_rect.dat'
    myTargetFilename='dat/output_'+vTopicName[1:]+'_ICP_line_fit_rect.dat'
    myLineFitCenter=myCreateDatFileBoxRectangle(myLineFits,myTargetFilename)
    myGnuPlotCmds.append('"'+myTargetFilename+'" lt rgb "black" linewidth 3 title "box",')
    #trajectory of box center
    myRotate=0#degrees rotate the robot angle, for plotting only
    myTranslateX=0.0
    myTranslateY=0.0
    myLineFitTrajFilename='dat/output_'+vTopicName[5:9]+'_ICP_line_fit_traj.dat'
    myTargetFilename='dat/output_'+vTopicName[1:]+'_ICP_line_fit_traj.dat'
    myCreateDatFileTrajectoryLineFits(myLineFitTrajFilename,myTargetFilename,myLineFitCenter)
    myGnuPlotCmds.append('"'+myTargetFilename+'" lt rgb "green" linewidth 3 title "box center" with line\n')
  else:
    myGnuPlotCmds.append('')
    #for box center trajectory keep existing points
    myLineFitTrajFilename='dat/output_'+vTopicName[5:9]+'_ICP_line_fit_traj.dat'
    myTargetFilename='dat/output_'+vTopicName[1:]+'_ICP_line_fit_traj.dat'
    myCreateDatFileTrajectoryNoLineFits(myLineFitTrajFilename,myTargetFilename)
    myGnuPlotCmds.append('"'+myTargetFilename+'" lt rgb "green" linewidth 3 title "box center" with line\n')
  #if myDebug:
  #print "myICP_Consecutive has "+str(len(myGnuPlotCmds))+" elements"
  return myGnuPlotCmds
  
def myICP_Consecutive_MakeEmpty(vTopicName):
  myGnuPlotCmds=[]
  myTargetFilename='dat/output_'+vTopicName[1:]+'_ICP.dat'
  f = open(myTargetFilename, 'w')
  f.write("0 0\n")
  f.close()
  myGnuPlotCmds.append('plot "'+myTargetFilename+'" u 1:2 title "'+vTopicName[5:9]+'"\n')
  myTargetFilename='dat/output_'+vTopicName[1:]+'_ICP_mod.dat'
  f = open(myTargetFilename, 'w')
  f.write("0 0\n")
  f.close()
  myGnuPlotCmds.append('"'+myTargetFilename+'" u 1:2 title "'+vTopicName[5:9]+'"')
  return myGnuPlotCmds
  