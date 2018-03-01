function [ act ] = plot_on( hObject, eventdata, handles )
%to plot sac on the axes
act='';
handles.pc=1;
if handles.Edata==0
    act='readsacfile_Callback(hObject, eventdata, handles);';return;
end

i0=handles.figure_index;handles.fax(1)=inf;handles.fax(2)=-inf;
for i=1:handles.fnum
eval(['axes(handles.',handles.ftag{i},')']);
handles=plot_sac(hObject, eventdata, handles,i+i0-1);
end
if handles.rela==0
    UD=get(gca,'UserData');
    UD.ax(1:2)=handles.fax(1:2);
    axis_update2( hObject,UD,handles);
end
act=handles;
end

