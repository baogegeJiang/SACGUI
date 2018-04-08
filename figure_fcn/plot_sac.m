function [ handles ] = plot_sac( hObject, eventdata, handles,index )

bdFcn=get(gca,'ButtonDownFcn');
tag=get(gca,'Tag');
UD=get(gca,'UserData');

if handles.Edata==0;state_new(hObject, eventdata, handles,'no_data_read_in');return;end
i=index;if index<=0;i=1;state_new(hObject, eventdata, handles,'plotting_first_one');end
    
if i>length(handles.sac);
    state_new(hObject, eventdata, handles,'plotting_done');return;
end

sac=handles.sac(i).sac;
x=sac.DATA1;lx=length(x);
nztime=(sac.NZHOUR*60+sac.NZMIN)*60+sac.NZSEC+0.001*sac.NZMSEC;
t=sac.B : sac.DELTA : sac.E;t=t+nztime;lt=length(t);
x=x(1:min(lx,lt));t=t(1:min(lx,lt));
h1=plot(t,x,'b');hold on;plot([-1000000,1000000],[0,0]);hold off;
xmax=max(abs(x));

if UD.pindex==1
UD.ax=[sac.B,sac.E,-xmax*1.1,xmax*1.1]+nztime;
end
UD.point(1).p=[[sac.B;sac.E]+nztime,[-xmax*1.1;xmax*1.1]];

axis_update(UD);
name=sac.FILENAME;time=datestr(datenum(sac.NZYEAR,1,0)+sac.NZJDAY);
handles.fax(1)=min(handles.fax(1),UD.ax(1));handles.fax(2)=max(handles.fax(2),UD.ax(2));

%legend(h1,[name,'  ',time]);
h(1)=h1;
hStr{1,1}=[name,'  ',time];
hold on
if ~isnan(sac.F)
p=sac.F;Y=get(gca,'Ylim');hTmp=plot([p(1),p(1)],[Y(1)*0.8,Y(2)*0.8],'r');text(p(1),Y(2)*0.9,'F');
h(end+1)= hTmp;hStr{1,end+1}='F';
end
if ~isnan(sac.A)
p=sac.A;Y=get(gca,'Ylim');hTmp=plot([p(1),p(1)],[Y(1)*0.8,Y(2)*0.8],'r');text(p(1),Y(2)*0.9,'P');
h(end+1)= hTmp;hStr{1,end+1}='P';
end
if ~isnan(sac.T0)
p=sac.T0;Y=get(gca,'Ylim');hTmp=plot([p(1),p(1)],[Y(1)*0.8,Y(2)*0.8],'r');text(p(1),Y(2)*0.9,'S');
h(end+1)= hTmp;hStr{1,end+1}='S';
end
hold off
legend(h,hStr);
UD.figure_index=i;
new_handles = gca; 

set(new_handles,'Tag',tag,'Layer','top','ButtonDownFcn',bdFcn,'UserData',UD);
eval(['handles.',tag,'=new_handles;']);
handles.pc=1;
guidata(hObject, handles);

end

