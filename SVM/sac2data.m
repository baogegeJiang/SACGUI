function [data,bSec,delta]=sac2data(sacE,sacN,sacZ);
bTime=clock;
delta=sacE.DELTA;
f=[2,10]; nodelay=2; mode='butter1';delta1=0.02;order=4;
setPara;
delta0=sacE.DELTA;
f1=ceil(1/delta1); 
f0=ceil(1/delta0);
if doFilt>0
   sacE.DATA1=filter_fcn(  sacE.DATA1,delta0,mode,order,f,nodelay );
   sacN.DATA1=filter_fcn(  sacN.DATA1,delta0,mode,order,f,nodelay );
   sacZ.DATA1=filter_fcn(  sacZ.DATA1,delta0,mode,order,f,nodelay );
end
bE=ceil((sacE.NZJDAY*24*3600+sacE.NZHOUR*3600+sacE.NZMIN*60+sacE.NZSEC+sacE.NZMSEC/1000+sacE.B)/delta);
bN=ceil((sacN.NZJDAY*24*3600+sacN.NZHOUR*3600+sacN.NZMIN*60+sacN.NZSEC+sacN.NZMSEC/1000+sacN.B)/delta);  
bZ=ceil((sacZ.NZJDAY*24*3600+sacZ.NZHOUR*3600+sacZ.NZMIN*60+sacZ.NZSEC+sacZ.NZMSEC/1000+sacZ.B)/delta);  
eE=bE+sacE.NPTS-1;
eN=bN+sacN.NPTS-1; 
eZ=bZ+sacZ.NPTS-1;
delta=sacE.DELTA;
b=max([bE,bN,bZ]);bSec=b*delta;
e=min([eE,eN,eZ]);
L=b:e;
data=[sacE.DATA1(L-bE+1),sacN.DATA1(L-bN+1),sacZ.DATA1(L-bZ+1)];
if isResample==1 && max(f1/f0,f0/f1)>1.1 && length(data)>0
data=resample(data,f1,f0);
end
%fprintf('sac2data used time:  %f s\n',etime(clock,bTime));
