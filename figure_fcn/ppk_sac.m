function [ handles ] = ppk_sac(hObject, eventdata, handles,varargin)
    varargin=varargin{1};
    if strcmp(class(varargin{1}),'char')==0;varargin=varargin{1};end
    index=str2num(varargin{2});b=3;
    if strcmp(varargin{3},'r'); 
        set(handles.relative,'Value',1);b=4;
        handles.rela=get(handles.relative,'Value');
    end
    set(handles.sacfile_lst,'String',varargin(b:length(varargin)));
    set(handles.write_over,'Value',1);
    handles.wo=get(handles.write_over,'Value'); 
    handles=creat_sacfigure(hObject, eventdata, handles,index);
end

