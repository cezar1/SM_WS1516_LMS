import math
import datetime
myGnuPlotCmds=[]
myDebug=False
mySubtractThreshhold=0.3

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
def myGnu2DCartesian(dataSeriesRaw,vTopicName,vDateTime,vTopicPose,dataSeriesBackGround):
  myGnuPlotCmds=[]
  myDebug=False
  #make two passes, one with original coordinates, other with transformations
  #original
  myRotate=0#degrees rotate the robot angle, for plotting only
  myTranslateX=0.0
  myTranslateY=0.0
  myTargetFilename='dat/output_'+vTopicName[1:]+'.dat'
  myCreateDatFile(dataSeriesRaw,myTargetFilename,myTranslateX,myTranslateY,myRotate)
  myGnuPlotCmds.append('plot "'+myTargetFilename+'" u 1:2 lt rgb "red" title "'+vTopicName[5:9]+'"\n')
  #rotated
  myTranslateX=float(vTopicPose[0])
  myTranslateY=float(vTopicPose[1])
  myRotate=float(vTopicPose[2])
  myTargetFilename='dat/output_'+vTopicName[1:]+'_mod.dat'
  myCreateDatFile(dataSeriesRaw,myTargetFilename,myTranslateX,myTranslateY,myRotate)
  myGnuPlotCmds.append('"'+myTargetFilename+'" u 1:2 title "'+vTopicName[5:9]+'",')
  #sample untranslated unrotated
  myRotate=0#degrees rotate the robot angle, for plotting only
  myTranslateX=0.0
  myTranslateY=0.0
  myTargetFilename='dat/output_'+vTopicName[1:]+'_sub.dat'
  myCreateDatFileSample(dataSeriesRaw,myTargetFilename,myTranslateX,myTranslateY,myRotate,dataSeriesBackGround)
  myGnuPlotCmds.append('plot "'+myTargetFilename+'" u 1:2 lt rgb "red" title "'+vTopicName[5:9]+'"\n')
  
  if myDebug:print "myGnu2DCartesian has "+str(len(myGnuPlotCmds))+" elements"
  return myGnuPlotCmds
  
def myGnu2DCartesianMakeEmpty(vTopicName):
  myGnuPlotCmds=[]
  myTargetFilename='dat/output_'+vTopicName[1:]+'.dat'
  f = open(myTargetFilename, 'w')
  f.write("0 0\n")
  f.close()
  myGnuPlotCmds.append('plot "'+myTargetFilename+'" u 1:2 title "'+vTopicName[5:9]+'"\n')
  myTargetFilename='dat/output_'+vTopicName[1:]+'_mod.dat'
  f = open(myTargetFilename, 'w')
  f.write("0 0\n")
  f.close()
  myGnuPlotCmds.append('"'+myTargetFilename+'" u 1:2 title "'+vTopicName[5:9]+'"')
  return myGnuPlotCmds
  