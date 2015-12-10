#include <stdlib.h>
#include "ros/ros.h"
#include "std_msgs/String.h"
#include "sensor_msgs/LaserScan.h"

double myRangeDurationSums[50000];
int myTotalRangesDurations=0;
long myTime;
const int myTimeStepSize=0;//[seconds]
const int myRangeSelect=541;//[limit the number of ranges sumed]
int myRangesSumed;
std::string myOutputFileName; 
std::string myTopicName="/LMS_irma";
FILE * myOutputFile;
void putFileHeader(FILE *vFile)
{
  fprintf(vFile,"# topic %s\n",myTopicName.c_str());  
}
void scanValues(const sensor_msgs::LaserScan laser)
{
    //fprintf(stderr,"\n -------- size[%d] ---------- ", laser.ranges.size());
		//fprintf(stderr,"scanValues() - time %d\n",laser.header.stamp.sec);
		double myCurrentSum=0;
		for (unsigned int i=0; i<myRangeSelect;i++)
    {
        //fprintf(stderr,"range[%d]=[%f]: ", i, laser.ranges[i]);
				myCurrentSum+=laser.ranges[i];
    }
		myRangeDurationSums[myTotalRangesDurations]=myCurrentSum;
		myOutputFile=fopen(myOutputFileName.c_str(),"a");
		putFileHeader(myOutputFile);
  	myTime=laser.header.stamp.sec;
		fprintf(stderr,"Sum [%d]=[%f] from first %d ranges, at seconds %d and ns %d \n",myCurrentSum,myTotalRangesDurations,myRangeSelect,laser.header.stamp.sec,laser.header.stamp.nsec);
		fprintf(myOutputFile,"%d %f %d %d\n",myTotalRangesDurations, myRangeDurationSums[myTotalRangesDurations],laser.header.stamp.sec,laser.header.stamp.nsec);
		fclose (myOutputFile);
		myTotalRangesDurations++;
		if (myTotalRangesDurations%100==0)
		{
			//fprintf(stderr,"Reached 100");
			system("./mySendForAnalysis.sh ");
		}
}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "hLaserReader");
  ros::NodeHandle n;
  
  ros::Subscriber hokuyoSubscriber = n.subscribe(myTopicName, 1, scanValues);
	char numstr[3];
	//snprintf(numstr, sizeof(numstr), "%d", myTimeStepSize);
	myOutputFileName="LaserScan_ts"+std::string(numstr)+".txt";
	//fprintf(stderr,"%d %d \n", argc,argv[0]);
	fprintf(stderr,"Subscribed to %s. Printing to %s. \n",myTopicName.c_str(), myOutputFileName.c_str());
	myOutputFile=fopen(myOutputFileName.c_str(),"w");
	putFileHeader(myOutputFile);
	fprintf(myOutputFile,"# topic %s\n",myTopicName.c_str());
	fclose (myOutputFile);
	//ros::Subscriber clockSubscriber = n.subscribe("/clock", 1, updateClock);
  ros::spin();
  return 0;
}
