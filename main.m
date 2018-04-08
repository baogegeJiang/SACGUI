function varargout = main(varargin)
% MAIN MATLAB code for main.fig
%      MAIN, by itself, creates a new MAIN or raises the existing
%      singleton*.
%
%      H = MAIN returns the handle to a new MAIN or the handle to
%      the existing singleton*.
%
%      MAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MAIN.M with the given input arguments.
%
%      MAIN('Property','Value',...) creates a new MAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before main_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to main_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help main

% Last Modified by GUIDE v2.5 28-Feb-2018 20:59:49

% Begin initialization code - DO NOT EDIT
addpath(genpath(pwd));
%global machineIsPhaseG machineIsPG
%load machineIsPhase
%load machineIsP
%machineIsPhaseG=machineIsPhase;
%machineIsPG=machineIsP;
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @main_OpeningFcn, ...
                   'gui_OutputFcn',  @main_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before main is made visible.
function main_OpeningFcn(hObject, eventdata, handles, varargin)
set(0,'Units','normalized');
handles.pc=1;
handles.rela=0;
handles.output = hObject;
handles.Edata=0;handles.wo=0;
load ret
handles.ret=ret;
% Update handles structure
handles.sacfbf=get(handles.sacfigure1,'ButtonDownFcn');handles.figure_index=0;
guidata(hObject, handles);index=1;
l=length(varargin);
if l==0;creat_sacfigure(hObject, eventdata, handles,index);return;end;
if ischar(varargin{1})==0; varargin=varargin{1};end
handles=open_ing(hObject, eventdata, handles,varargin);

    



function varargout = main_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function sacfigure1_CreateFcn(hObject, eventdata, handles)
set(gca,'XAxisLocation','bottom');
handles.Edata=0;UD.figure_index=0;
UD.figure_index=0;
UD.point(1).p=[[0;10],[-5;5]];
UD.pindex=1;
UD.ax=[0,10,-5,5];
xlim(UD.ax(1:2));
set(gca,'UserData',UD);
handles.ftag{1}='sacfigure1';handles.fnum=1;
guidata(hObject, handles);



function sacfile_lst_Callback(hObject, eventdata, handles)
handles.figure_index=get(hObject,'Value');
guidata(hObject, handles);

    



% Hints: get(hObject,'String') returns contents of sacfile_lst as text
%        str2double(get(hObject,'String')) returns contents of sacfile_lst as a double


% --- Executes during object creation, after setting all properties.
function sacfile_lst_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
set(hObject,'String',{'sacfile list'});




% --- Executes on button press in sacfile_browser1.
function sacfile_browser_Callback(hObject, eventdata, handles)
[filename,pathname,fileindex]=uigetfile('*.*','MultiSelect','on');

if fileindex==0
    return
end

temp{:,:}=get(handles.sacfile_lst,'String');
set(handles.sacfile_lst,'String',browser_add_get_list(temp,filename,pathname));
if ishandle(handles.plotsac); uicontrol(handles.plotsac);end;




% --- Executes on button press in plotsac.
function plotsac_Callback(hObject, eventdata, handles)
if handles.Edata==0
    handles=read_sac(hObject, eventdata, handles);
end
i0=handles.figure_index;
plot_on( hObject, eventdata, handles );
%for i=1:handles.fnum
%eval(['axes(handles.',handles.ftag{i},')']);
%plot_sac(hObject, eventdata, handles,i+i0-1);
%end



% --- Executes on button press in readsacfile.
function readsacfile_Callback(hObject, eventdata, handles)
handles=read_sac( hObject, eventdata, handles);
  

% --- Executes on selection change in state.
function state_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function state_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on key press with focus on state and none of its controls.
function state_KeyPressFcn(hObject, eventdata, handles)
key = get(gcf,'CurrentCharacter');
eval(keypress(hObject, eventdata, handles,key));



% --- Executes on button press in clear_figure.
function clear_figure_Callback(hObject, eventdata, handles)
creat_sacfigure(hObject, eventdata, handles,handles.fnum);




function plotsac_KeyPressFcn(hObject, eventdata, handles)
key = get(gcf,'CurrentCharacter');
eval(keypress(hObject, eventdata, handles,key));
if ishandle(handles.plotsac); uicontrol(handles.plotsac);end;     





function sacfigure1_ButtonDownFcn(hObject, eventdata, handles)
if ishandle(handles.plotsac); uicontrol(handles.plotsac);end;
uicontrol(handles.plotsac);


function sacfile_lst_ButtonDownFcn(hObject, eventdata, handles)
handles.figure_index=get(hObject,'Value')-1;
guidata(hObject, handles);



function out_handles_Callback(hObject, eventdata, handles)
 %set(handles.sacfigure1,'units','normalized');
 %get(handles.sacfigure1,'Position')
 %get(0,'ScreenSize')



function figure1_KeyPressFcn(hObject, eventdata, handles)
key = get(gcf,'CurrentCharacter');
eval(keypress(hObject, eventdata, handles,key));


function sacfile_browser_KeyPressFcn(hObject, eventdata, handles)
key = get(gcf,'Currentcharacter');
eval(keypress(hObject, eventdata, handles,key));


% --- Executes on key press with focus on readsacfile and none of its controls.
function readsacfile_KeyPressFcn(hObject, eventdata, handles)
key = get(gcf,'Currentcharacter');
eval(keypress(hObject, eventdata, handles,key));


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over out_handles.
function out_handles_ButtonDownFcn(hObject, eventdata, handles)



function runs_Callback(hObject, eventdata, handles)
temp=get(hObject,'String');
%eval(temp)
running( temp,hObject, eventdata, handles);
set(hObject,'String','');



% --- Executes during object creation, after setting all properties.
function runs_CreateFcn(hObject, eventdata, handles)
% hObject    handle to runs (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on key press with focus on sacfile_lst and none of its controls.
function sacfile_lst_KeyPressFcn(hObject, eventdata, handles)
key = get(gcf,'Currentcharacter');
eval(keypress(hObject, eventdata, handles,key));


% --- Executes when figure1 is resized.
function figure1_SizeChangedFcn(hObject, eventdata, handles)


% --- Executes on button press in write_over.
function write_over_Callback(hObject, eventdata, handles)
handles.wo=get(hObject,'Value');
guidata(hObject, handles);



% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over write_over.
function write_over_ButtonDownFcn(hObject, eventdata, handles)
handles.wo=get(hObject,'Value');
guidata(hObject, handles);


% --- Executes on button press in add_axes.
function add_axes_Callback(hObject, eventdata, handles)
creat_sacfigure(hObject, eventdata, handles,handles.fnum+1);


% --- Executes on button press in sub_axes.
function sub_axes_Callback(hObject, eventdata, handles)
creat_sacfigure(hObject, eventdata, handles,handles.fnum-1);


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over sub_axes.
function sub_axes_ButtonDownFcn(hObject, eventdata, handles)


function plotsac_ButtonDownFcn(hObject, eventdata, handles)


% --- Executes on button press in relative.
function relative_Callback(hObject, eventdata, handles)
handles.rela=get(hObject,'Value');
guidata(hObject,handles);


% --- Executes on button press in show_help.
function show_help_Callback(hObject, eventdata, handles)
edit sac_solve_help.txt


% --- Executes during object creation, after setting all properties.
function relative_CreateFcn(hObject, eventdata, handles)
% hObject    handle to relative (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function freq_low_Callback(hObject, eventdata, handles)
%handles=plot_freq(hObject, eventdata, handles);


% --- Executes during object creation, after setting all properties.
function freq_low_CreateFcn(hObject, eventdata, handles)
% hObject    handle to freq_low (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function freq_high_Callback(hObject, eventdata, handles)
%handles=plot_freq(hObject, eventdata, handles);

% --- Executes during object creation, after setting all properties.
function freq_high_CreateFcn(hObject, eventdata, handles)
% hObject    handle to freq_high (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



% --- Executes on button press in do_filter.
function do_filter_Callback(hObject, eventdata, handles)
handles=filtering(hObject, eventdata, handles);

% --- Executes on selection change in mode_filter.
function mode_filter_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function mode_filter_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in no_delay.
function no_delay_Callback(hObject, eventdata, handles)


% --- Executes on key press with focus on do_filter and none of its controls.
function do_filter_KeyPressFcn(hObject, eventdata, handles)
key = get(gcf,'Currentcharacter');
eval(keypress(hObject, eventdata, handles,key));
uicontrol(handles.plotsac);


% --- Executes on button press in plot_freq.
function plot_freq_Callback(hObject, eventdata, handles)

handles=plot_freq(hObject, eventdata, handles);

% --- Executes on selection change in mode_freq.
function mode_freq_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function mode_freq_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in loglog.
function loglog_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function loglog_CreateFcn(hObject, eventdata, handles)
set(hObject,'Value',1);


% --- Executes during object creation, after setting all properties.
function no_delay_CreateFcn(hObject, eventdata, handles)
%set(hObject,'Value',1);


% --- Executes on button press in pushbutton23.
function pushbutton23_Callback(hObject, eventdata, handles)
handles = pickPhase( hObject, eventdata, handles );


% --- Executes on button press in inWindow.
function inWindow_Callback(hObject, eventdata, handles)
% hObject    handle to inWindow (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of inWindow


% --- Executes on key press with focus on plot_freq and none of its controls.
function plot_freq_KeyPressFcn(hObject, eventdata, handles)
key = get(gcf,'Currentcharacter');
eval(keypress(hObject, eventdata, handles,key));
uicontrol(handles.plot_freq);



function filterOrder_Callback(hObject, eventdata, handles)
% hObject    handle to filterOrder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of filterOrder as text
%        str2double(get(hObject,'String')) returns contents of filterOrder as a double


% --- Executes during object creation, after setting all properties.
function filterOrder_CreateFcn(hObject, eventdata, handles)
% hObject    handle to filterOrder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in saveFig.
function saveFig_Callback(hObject, eventdata, handles)
figName=sprintf('%s/output/%s.jpg',pwd,datestr(now,30));
%print(gcf,figName,'-djpeg','-r500');
saveas(gcf,figName);


% --- Executes on key press with focus on saveFig and none of its controls.
function saveFig_KeyPressFcn(hObject, eventdata, handles)

