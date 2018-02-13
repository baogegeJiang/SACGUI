function [ handles ] = creat_sacfigure(hObject, eventdata, handles,index)
fnum=handles.fnum;
if index<0
    state_new( hObject, eventdata, handles,{'cannot subtract sacfigure'});return;
end
handles.fnum=index;
for i=1:fnum
    name=handles.ftag{i};
    eval(['temp=handles.',name,';']);
    cla(temp);
    set(temp,'Layer','bottom','Position',[0,0,0.01,0.01],'FontUnits','normalized');
    UD=get(temp,'UserData');UD.pindex=1;set(temp,'UserData',UD);
end

if index==1; de=0;else de =0.3;end
for i=1:index
   
    pos=[0.05,0.25+0.65*((index-i)/index),0.45,0.6/(index+de)];
    name=['sacfigure',num2str(i)];handles.ftag{i}=name;
    if i<=fnum
    eval(['temp=handles.',name,';']);
    a=temp;
    set(a,'Unit','normalized','Position',pos,'Tag',name,'FontUnits','normalized','FontSize',0.03);
    else
    a=axes('Unit','normalized','Position',pos,'Tag',name,'FontUnits','normalized','FontSize',0.03);
    end
    cla(a,'reset');
    set(a,'Unit','normalized','Position',pos,'Tag',name,'FontUnits','normalized','FontSize',0.03);
    set(a,'ButtonDownFcn',handles.sacfbf);
    eval(['handles.',name,'=a;']);
    set(a,'XAxisLocation','bottom');
    UD.figure_index=0;
    UD.point(1).p=[[0;10],[-5;5]];
    UD.pindex=1;
    UD.ax=[0,10,-5,5];
    axis_update(UD);
    set(a,'UserData',UD);
end
guidata(hObject, handles);
