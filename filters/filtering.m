function [ handles ] = filtering( hObject, eventdata, handles )
default_order=2;
if handles.Edata==0;
    handles=read_sac( hObject, eventdata, handles );
end
if handles.Edata==0;return;end
orderStr=get(handles.filterOrder,'String');
if isempty(orderStr)==0
    order=str2num(orderStr);
    if length(order)==1
        default_order=order;
    end
end

mode_value=get(handles.mode_filter,'Value');
switch mode_value
    case 1
        mode='butter';
    case 2
        mode='bessel';
    case 3
        mode='butter1';
end

nodelay=get(handles.no_delay,'Value');

flt=get(handles.freq_low,'String');
if isempty(flt); flt='0';end
if ischar(flt)==0; flt=flt{1};end
fl=str2num(flt);

fht=get(handles.freq_high,'String');
if isempty(fht); fht='100000';end
if ischar(fht) ==0; fht=fht{1};end
fh=str2num(fht);

for i=1:length(handles.sac)
    delta=handles.sac(i).sac.DELTA;
    handles.sac(i).sac.DATA1=filter_fcn(handles.sac(i).sac.DATA1,delta,mode,default_order,[fl,fh],nodelay);
end
guidata(hObject,handles);
if handles.pc==1
plot_on( hObject, eventdata, handles );
elseif handles.pc==2
    plot_freq( hObject, eventdata, handles);
end
end

