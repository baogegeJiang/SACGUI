function [ output_args ] = axis_update2( hObject,UD,handles )
if handles.Edata==0
xlim(UD.ax(1:2));return;
end
if UD.figure_index==0;return;end
sac=handles.sac(UD.figure_index).sac;
nt=sac.B+(sac.NZHOUR*60+sac.NZMIN)*60+sac.NZSEC+0.001*sac.NZMSEC;
p=[UD.ax(1);UD.ax(2)];
fnum=handles.fnum;
for i=1:fnum
    name=handles.ftag{i};
    eval(['temp=handles.',name,';']);tUD=get(temp,'UserData');
    sac=handles.sac(tUD.figure_index).sac;
    nt1=sac.B+(sac.NZHOUR*60+sac.NZMIN)*60+sac.NZSEC+0.001*sac.NZMSEC;
    tp=p;
    if handles.rela==1;
        tp=p+nt1-nt;
    end
    tUD.point(tUD.pindex+1).p(:,1)=tp;
    tUD.pindex=tUD.pindex+1;
    tUD.ax(1)=tp(1);
    tUD.ax(2)=tp(2);
    set(temp,'XLim',tp','UserData',tUD);
end
guidata(hObject,handles);
end


