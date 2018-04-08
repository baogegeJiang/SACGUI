function [ handles ] = plot_freq_one(hObject, eventdata, handles,index,mode)
bdFcn=get(gca,'ButtonDownFcn');
tag=get(gca,'Tag');
UD=get(gca,'UserData');

if handles.Edata==0;state_new(hObject, eventdata, handles,'no_data_read_in');return;end
i=index;if index<=0;i=1;state_new(hObject, eventdata, handles,'plotting_first_one');end

if i>length(handles.sac);
    state_new(hObject, eventdata, handles,'plotting_done');return;
end
sac=handles.sac(i).sac;
data=sac.DATA1;
if get(handles.inWindow,'Value')
   fAX=handles.fax;
   bSec=(sac.NZHOUR*60+sac.NZMIN)*60+sac.NZSEC+0.001*sac.NZMSEC+sac.B;
   eSec=(sac.NZHOUR*60+sac.NZMIN)*60+sac.NZSEC+0.001*sac.NZMSEC+sac.E;
   lx=length(data);
   timeL=bSec:sac.DELTA:eSec;
   lt=length(timeL);
   data=data(1:min(lx,lt));timeL=timeL(1:min(lx,lt));
   L=find((timeL-UD.point(UD.pindex).p(1)).*(timeL-UD.point(UD.pindex).p(2))<0);
   data=sac.DATA1(L);
   data=data-mean(data);
end
[comp,freq]=sac_freq(data,sac.DELTA);
if length(comp)>100
comp(1:60)=0;
end
handles.sac(i).comp=comp;handles.sac(i).freq=freq;
switch mode
    case 'phase'
        y=angle(comp);
    case 'amp'
        y=abs(comp);
    case 'real'
        y=real(comp);
    case 'img'
        y=real(comp);
end
l=length(freq);lb=floor(l/2);
if get(handles.loglog,'Value')
loglog(freq(1:lb),y(1:lb));
else
    plot(freq(1:lb),y(1:lb));
end
name=sac.FILENAME;time=datestr(datenum(sac.NZYEAR,1,0)+sac.NZJDAY);
hold off;legend([mode,': ',name,' ',time]);xlabel('f/hz');
xlim([0,freq(lb)]);
UD.figure_index=i;
new_handles = gca; 

set(new_handles,'Tag',tag,'Layer','top','ButtonDownFcn',bdFcn,'UserData',UD);
eval(['handles.',tag,'=new_handles;']);
guidata(hObject, handles);
end

