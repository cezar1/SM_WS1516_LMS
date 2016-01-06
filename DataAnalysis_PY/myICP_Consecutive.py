import math
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
  myGnuPlotCmds.append('"'+myTargetFilename+'" u 1:2 lt rgb "green" title "'+vTopicName[5:9]+' previous",')
  if myDebug:print "myICP_Consecutive has "+str(len(myGnuPlotCmds))+" elements"
  #ICP iterations, blue
  myRotate=0#degrees rotate the robot angle, for plotting only
  myTranslateX=0.0
  myTranslateY=0.0
  myTargetFilename='dat/output_'+vTopicName[1:]+'_ICP_iterations.dat'
  myCreateDatFileICP(dataSeriesSub,myTargetFilename,myTranslateX,myTranslateY,myRotate,dataSeriesPrevSub)
  #5
  myGnuPlotCmds.append('"'+myTargetFilename+'" lt rgb "blue" title "'+vTopicName[5:9]+' matches" with line\n')
  if myDebug:print "myICP_Consecutive has "+str(len(myGnuPlotCmds))+" elements"
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
  