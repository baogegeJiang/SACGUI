function [ handles ] = read_sac( hObject, eventdata, handles )
sacfile{:,:}=get(handles.sacfile_lst,'String');
if strcmp(sacfile{1,1},'sacfile list')
    string{1,1}= 'no file in list';
    state_new(hObject, eventdata, handles,string);
    return
end
sacfile=sacfile{1,1};

for i=length(sacfile):-1:1
sac=readsac(sacfile{i});tsac(i).sac=sac;tsac(i).filepath=sacfile{i};
end
handles.sac=tsac;string=cell(0,0);
string{1,1}= 'read in';
state_new(hObject, eventdata, handles,string);
handles.Edata=1;handles.figure_index=1;
handles=creat_sacfigure(hObject, eventdata, handles,handles.fnum);
guidata(hObject, handles);
if ishandle(handles.plotsac); uicontrol(handles.plotsac);end;
end

