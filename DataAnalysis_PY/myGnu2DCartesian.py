import math
import datetime
myGnuPlotCmds=[]


def myOutput(vMessage):
  myGnuPlotCmds.append(vMessage)
def myGnu2DCartesian(dataSeriesRaw,vTopicName,vDateTime,vTopicPose):
  myGnuPlotCmds=[]
  myDebug=False
  #print myRotate
  if myDebug:print "myGnu2DCartesian on date "+str(dataSeriesRaw[0])+" and topic "+vTopicName
  #make two passes, one with original coordinates, other with transformations
  #original
  myRotate=0#degrees rotate the robot angle, for plotting only
  myTranslateX=0.0
  myTranslateY=0.0
  myTargetFilename='dat/output_'+vTopicName[1:]+'.dat'
  f = open(myTargetFilename, 'w')
  for i in range(1,len(dataSeriesRaw),2):
    #checking point angle and range
    myX=math.cos(math.radians(float(dataSeriesRaw[i])/2+myRotate))*float(dataSeriesRaw[i+1])+myTranslateX
    myY=math.sin(math.radians(float(dataSeriesRaw[i])/2+myRotate))*float(dataSeriesRaw[i+1])+myTranslateY
    #if myDebug:print "Angle "+str(float(dataSeriesRaw[i])/2)+" range "+str(dataSeriesRaw[i+1])+"=> X ["+str(myX)+"] Y ["+str(myY)+"]"
    f.write(str(myX)+" "+str(myY)+"\n")
  f.close() 
  myGnuPlotCmds.append('plot "'+myTargetFilename+'" u 1:2 lt rgb "red" title "'+vTopicName[5:9]+'"\n')
  #rotated
  #if vTopicName[5:9]=="irma":
  #0#degrees rotate the robot angle, for plotting only
  myTranslateX=float(vTopicPose[0])
  myTranslateY=float(vTopicPose[1])
  myRotate=float(vTopicPose[2])
  if myDebug:print "Translate X "+str(myTranslateX)+" translate Y "+str(myTranslateY)+" rotate Z "+str(myRotate)
  #elif vTopicName[5:9]=="lars":
    #myRotate=0#degrees rotate the robot angle, for plotting only
    #myTranslateX=0.0
    #myTranslateY=0.0
  #elif vTopicName[5:9]=="achi":
    #myRotate=0#degrees rotate the robot angle, for plotting only
    #myTranslateX=0.0
    #myTranslateY=0.0
  #else:
    #myRotate=0#degrees rotate the robot angle, for plotting only
    #myTranslateX=0.0
    #myTranslateY=0.0
  myTargetFilename='dat/output_'+vTopicName[1:]+'_mod.dat'
  f = open(myTargetFilename, 'w')
  for i in range(1,len(dataSeriesRaw),2):
    #checking point angle and range
    myX=math.cos(math.radians(float(dataSeriesRaw[i])/2+myRotate))*float(dataSeriesRaw[i+1])+myTranslateX
    myY=math.sin(math.radians(float(dataSeriesRaw[i])/2+myRotate))*float(dataSeriesRaw[i+1])+myTranslateY
    #if myDebug:print "Angle "+str(float(dataSeriesRaw[i])/2)+" range "+str(dataSeriesRaw[i+1])+"=> X ["+str(myX)+"] Y ["+str(myY)+"]"
    f.write(str(myX)+" "+str(myY)+"\n")
  f.close() 
  myGnuPlotCmds.append('"'+myTargetFilename+'" u 1:2 title "'+vTopicName[5:9]+'",')
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
  