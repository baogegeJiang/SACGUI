% we provide the paralle way; paraNum is the number of threads. if it's setted to 1, we will not do paralle calculation
paraNum=12;
% when mexSLR ==1, we will calculate SLR in 'C'; when mexSLR==0, we will not;
mexSLR=1;
% set the scnday list. the refDay should be ealier than sDay.
refDay=datenum(2015,1,1);sDay=datenum(2015,12,1);eDay=datenum(2017,5,1);
% if you need do filting on your data, set doFilt = 0 and set other filt parameters to suitable values else set do filt=0;
doFilt=0;
f=[2,20]; nodelay=1; mode='butter';delta1=0.02;order=4;
% doLoc=1: locate quakes and using these results to improve the accuracy; doLoc=0: not locate
doLoc=1;
% reDet=1,2,3...: we will relocate and re-pick record several times to improve the accuracy; reDet=0: not relocate and re-pick
reDet=0;
% saving the main waveform data in .mat form in matDir
saveSta=0;
% fastCal=1: do calculation in a fast way; fastCal=0: not in a fast way
% fastCalNum=1~25, the bigger the faster.
fastCal=1;
fastCalNum=25;
% reScan=1,2,3...: we will rescan the wavoform record several times to find if there is some missed quakes; reScan=0: not rescan
reScan=0;
% dmax: the max distance(km) between the quakes and stations when we locate the quakes
dmax=500;
% using the global variable to save the memory
globalSta=1;
% we can generate some simulate quakes to help us locate quakes. set the center point and max distance away from the center point
lo0=112;la0=39;r=3;
% the parameters using in stacking Sec and finding orign time. using the default setting is enough
dd1=0.2;dd2=0.05;dd3=0.05;
dd1=0.1;

isResample=1;
