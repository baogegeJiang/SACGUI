function [ handles ] = plot_freq(hObject, eventdata, handles)
handles.pc=2;
temp={'amp','phase','real','imag'};
mode=temp{get(handles.mode_freq,'Value')};
if handles.Edata==0
    handles=read_sac(hObject, eventdata, handles);
end

i0=handles.figure_index;handles.fax(1)=inf;handles.fax(2)=-inf;
for i=1:handles.fnum
eval(['axes(handles.',handles.ftag{i},')']);
handles=plot_freq_one(hObject, eventdata, handles,i+i0-1,mode);
end

end

