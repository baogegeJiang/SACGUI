function [ handles ] = open_ing( hObject, eventdata, handles,varargin )
varargin=varargin{1};
switch varargin{1}
    case 'ppk'
        handles=ppk_sac(hObject, eventdata, handles,varargin);
        if handles.Edata==0
        handles=read_sac(hObject, eventdata, handles);
        end
        i0=handles.figure_index;
        plot_on( hObject, eventdata, handles );
        guidata(hObject,handles);
        uicontrol(handles.plotsac);       
end
end

