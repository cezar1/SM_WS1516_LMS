import Gnuplot
import subprocess
import math
import sys
import datetime

myGnuPlotCmds=[]

def myOutput(vMessage):
	myGnuPlotCmds.append(vMessage)
def myNormal(x,mu,sd):
  return (1/(sd*math.sqrt(2*math.pi)))*math.exp(-(x-mu)**2/(2*sd**2))
def myHistogram(dataSeriesRaw,vBinComponents,vStartDateTime,vEndDateTime,vTopicName):
	myDebug=False	
	dataSeries=list(dataSeriesRaw)	
	dataSeries.sort()	
	if myDebug:print "Received dataSeries of "+str(len(dataSeries))+" elements and "+str(vBinComponents)+" histogram components requested."
	if myDebug:print "Minimum: " + str(dataSeries[0])
	if myDebug:print "Maximum: " + str(dataSeries[-1])
	myBinPadLower=0
	myBinPadHigher=0
	myDataLowBound=dataSeries[0]-myBinPadLower
	myDataHighBound=dataSeries[-1]+myBinPadHigher
	myBinWidth=(myDataHighBound-myDataLowBound)/vBinComponents
	if myDebug:print "Bin width: " + str(myBinWidth) 
	j=0	
	myBin=[]
	myBin.append(0)
	notFinishedBin=True
	#Statistics
	#Average
	myTotalSum=0
	for i in range(0,len(dataSeries)):
	  myTotalSum+=dataSeries[i]
	myAverage=myTotalSum/len(dataSeries)
	#Standard Deviation
	myVariance=0
	for i in range(0,len(dataSeries)):
	  myVariance=myVariance+pow(dataSeries[i]-myAverage,2)
	myVariance=myVariance/len(dataSeries)
	myStdDeviation=math.sqrt(myVariance)
	if (len(dataSeries) % 2==0):
	  myMedian=(dataSeries[len(dataSeries)/2]+dataSeries[1+len(dataSeries)/2])/2
	else:
	  myMedian=dataSeries[len(dataSeries)/2+1]
	#Optimised binning, single pass through data series
	for i in range(0,vBinComponents):
		myLocalDataLow=myDataLowBound+(i)*myBinWidth
		myLocalDataHigh=myLocalDataLow+myBinWidth
		notBinned=True		
		while notBinned and notFinishedBin:
			if j==len(dataSeries):			
				notFinishedBin=False
				if myDebug:print "Finished bin at element index "+str(j)+" and bin index "+str(i)
			elif dataSeries[j]>myLocalDataHigh:
				#reach to next bin
				myBin.append(0)
				notBinned=False
				if myDebug:print "Bin "+str(i)+": " + str(myBin[i])+" elements"			
				j=j+1			
			else:
				#not reached next bin yet
				myBin[i]=myBin[i]+1
				j=j+1 	
	#If last bins were not populated, resize to desired resolution
	if len(myBin)<vBinComponents:
		for i in range(len(myBin),vBinComponents):
			myBin.append(0)		
	if myDebug:print "Sanity check: Reached element "+str(j)+" of "+str(len(dataSeries))+" with "+str(len(myBin))+" bin components"
		#for i in dataSeries:
		#print i
	#Output histogram file
	f = open('output.txt', 'w')
	for i in range(0,vBinComponents):
	  f.write("%s\n" % myBin[i])
	f.close()
	#Output normal distribution file, scaled to average on y and with x coordinate in data series value
	f = open('output2.txt', 'w')
	myNormScale=max(myBin)/myNormal(myAverage,myAverage,myStdDeviation)
	#for i in range(int(dataSeries[0]),int(dataSeries[-1]),1):
	for i in range(700,1200,1):  
	  f.write( str(i) +" " +str(myNormScale*myNormal(i,myAverage,myStdDeviation))+"\n")
	f.close()
	
	myOutput('reset\n')
	myOutput('set style fill solid\n')
	myOutput('set xrange [ 0 : '+str(vBinComponents)+' ]\n')
	myOutput('set yrange [ 0 : '+str(max(myBin))+' ]\n')
	myOutput('set format y "%3.0f"\n')
	myOutput('set ylabel "Occurences"\n')
	myOutput('set x2label "Range sums"\n')
	#myOutput('set x2range [ '+str(dataSeries[0])+' : '+str(dataSeries[-1])+' ]\n')
	myOutput('set x2range [ '+str(700)+' : '+str(1200)+' ]\n')
	myOutput('set x2tics border\n')
	xposlabel=0.01
	yposlabel=0.98
	yposspacking=0.03
	myLocalLabelIndex=0
	myDateTimeStart=datetime.datetime.fromtimestamp(vStartDateTime)
	myDateTimeEnd=datetime.datetime.fromtimestamp(vEndDateTime)
	myOutput('set label "'+str(myDateTimeStart.strftime("%Y-%m-%d %H:%M:%S"))+'-'+str(myDateTimeEnd.strftime("%H:%M:%S"))+'" at graph '+str(xposlabel)+','+str(yposlabel-myLocalLabelIndex*yposspacking)+' tc rgb "black" left front\n')
	myLocalLabelIndex+=1
	myOutput('set label "Topic name='+str(vTopicName)+'" noenhanced at graph '+str(xposlabel)+','+str(yposlabel-myLocalLabelIndex*yposspacking)+' tc rgb "black" left front\n')
	myLocalLabelIndex+=1
	myOutput('set label "Total samples='+str(len(dataSeries))+'" at graph '+str(xposlabel)+','+str(yposlabel-myLocalLabelIndex*yposspacking)+' tc rgb "black" left front\n')
	myLocalLabelIndex+=1
	myOutput('set label "Total sum of ranges='+'{0:.2f}'.format(myTotalSum)+'" at graph '+str(xposlabel)+','+str(yposlabel-myLocalLabelIndex*yposspacking)+' tc rgb "green" left front\n')
	myLocalLabelIndex+=1
	myOutput('set label "Average of ranges='+'{0:.2f}'.format(myAverage)+'" at graph '+str(xposlabel)+','+str(yposlabel-myLocalLabelIndex*yposspacking)+' tc rgb "red" left front\n')
	myLocalLabelIndex+=1
	myOutput('set label "Standard dev of ranges='+'{0:.2f}'.format(myStdDeviation)+'" at graph '+str(xposlabel)+','+str(yposlabel-myLocalLabelIndex*yposspacking)+' left front\n')
	myLocalLabelIndex+=1
	myOutput('set label "Median of ranges='+'{0:.2f}'.format(myMedian)+'" at graph '+str(xposlabel)+','+str(yposlabel-myLocalLabelIndex*yposspacking)+' tc rgb "blue" left front\n')
	myOutput('set arrow from second '+str(myAverage)+',0 to second '+str(myAverage)+','+str(max(myBin))+' lw 3 lc rgb "red" nohead front\n')
	myOutput('set arrow from second '+str(myMedian)+',0 to second '+str(myMedian)+','+str(max(myBin))+' lw 3 lc rgb "blue" nohead front\n')
	myOutput('plot "output.txt" using 1 axes x1y1 with histograms title "Histogram" ,')
	myOutput('"output2.txt" using 1:2 with lines lw 3 axes x2y1 title "Gaussian Distribution"\n')
	#raw_input('Please press return to continue...\n')
	#myOutput('quit\n') #close the gnuplot window
	return myGnuPlotCmds

