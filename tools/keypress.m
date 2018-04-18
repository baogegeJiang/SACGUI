function [ act ] = keypress(hObject, eventdata, handles,key)
act='';
name=get(hObject,'Tag');
if handles.pc==2;
switch key
    
    case {'x','o','f','p','s'}
        return;
        
    case 'n'
        handles.figure_index=handles.figure_index+handles.fnum;
        if handles.figure_index>length(handles.sac);
            handles.figure_index=handles.figure_index-handles.fnum;
            state_new(hObject, eventdata, handles,'plotting_done');
        end
        plot_freq(hObject, eventdata, handles);
        guidata(hObject, handles);
    case 'c'
       if ismember({get(hObject,'Tag')},{'state'})
        set(hObject,'String', {'state'},'Value',1);end
       if ismember({get(hObject,'Tag')},{'sacfile_lst'})
        set(hObject,'Value',1);
        set(hObject,'String', {'sacfile list'},'Value',1);end
       if ismember({get(hObject,'Tag')},'plotsac');
        creat_sacfigure(hObject, eventdata, handles,handles.fnum);end
    case 'b'
    if strcmp(name,'plotsac')+strcmp(name,'plot_freq')
    handles.figure_index=handles.figure_index-handles.fnum;
    if  handles.figure_index<=0
        handles.figure_index=1;
        state_new(hObject, eventdata, handles,'plotting_first_one');
    end
    plot_freq(hObject, eventdata, handles);
    if strcmp(name,'plot_freq')
       plot_freq(hObject, eventdata, handles);
    end
    else
        uicontrol(handles.sacfile_browser);
    end
    guidata(hObject, handles);
end
return
end


switch key
    case 'n'
        handles.figure_index=handles.figure_index+handles.fnum;
        if handles.figure_index>length(handles.sac);
            handles.figure_index=handles.figure_index-handles.fnum;
            state_new(hObject, eventdata, handles,'plotting_done');
        end
        guidata(hObject, handles);
        handles=plot_on(hObject, eventdata, handles);
        if strcmp(name,'plot_freq')
           handles=plot_freq(hObject, eventdata, handles);
        end
        guidata(hObject, handles);
    case 'b'
    if strcmp(name,'plotsac') || strcmp(name,'plot_freq')
    handles.figure_index=handles.figure_index-handles.fnum;
    if  handles.figure_index<=0
        handles.figure_index=1;
        state_new(hObject, eventdata, handles,'plotting_first_one');
    end
    handles=plot_on(hObject, eventdata, handles);
    if strcmp(name,'plot_freq')
       plot_freq(hObject, eventdata, handles);
    end
       guidata(hObject, handles);
    else
        uicontrol(handles.sacfile_browser);
    end
    case 'x'
        p = ginput(2);
        if ismember({get(gca,'Tag')},handles.ftag)==0;return;end
        handle=gca;UD=handle.UserData;
        UD.ax(1)=min(p(:,1));
        UD.ax(2)=max(p(:,1));
        set(gca,'UserData',UD);
        guidata(hObject, handles);
        axis_update2( hObject,UD,handles);
        handles.fax(1)=min(handles.fax(1),UD.ax(1));handles.fax(2)=max(handles.fax(2),UD.ax(2));
        guidata(hObject,handles);
    case 'o'
        for i=1:handles.fnum
            name=handles.ftag{i};
            eval(['temp=handles.',name,';']);
            UD=temp.UserData;
            if UD.pindex>1
            p=UD.point(UD.pindex-1).p;
            UD.pindex=UD.pindex-1;
            UD.ax(1)=min(p(:,1));
            UD.ax(2)=max(p(:,1));
            set(temp,'UserData',UD);
            set(temp,'XLim',UD.ax(1:2));
            guidata(hObject, handles);
            end
        end
    case {'f','p','s'}
        if ismember({get(hObject,'Tag')},{'plotsac','figure1'})
            p = ginput(1);hold on;
            if ismember({get(gca,'Tag')},handles.ftag)==0;return;end
            handle=gca;UD=handle.UserData;
            switch key
                
                case 'f'
                   handles.sac(UD.figure_index).sac.F=p(1);temp='F';
                case 'p'
                    handles.sac(UD.figure_index).sac.A=p(1);temp='P';
                case 's'
                    handles.sac(UD.figure_index).sac.T0=p(1);temp='S';
            end
            
        Y=get(gca,'Ylim');
        h1=plot([p(1),p(1)],[Y(1)*0.8,Y(2)*0.8],'r');text(p(1),Y(2)*0.9,temp);hold off;
        try set(get(get(h1, 'Annotation'), 'LegendInformation'), 'IconDisplayStyle', 'off');end
        guidata(hObject, handles);
        end
   case handles.ret
       %[name,'_Callback(hObject, eventdata, handles)']
        act=[name,'_Callback(hObject, eventdata, handles);'];
   case 'c'
       if ismember({get(hObject,'Tag')},{'state'})
        set(hObject,'String', {'state'},'Value',1);end
       if ismember({get(hObject,'Tag')},{'sacfile_lst'})
        set(hObject,'String', {'sacfile list'},'Value',1);end
       if ismember({get(hObject,'Tag')},'plotsac');
        creat_sacfigure(hObject, eventdata, handles,handles.fnum);end
    case 'w'
        temp='_temp';
        if handles.wo==1
            temp='';
        end
        for i=1:length(handles.sac)
            filename=[handles.sac(i).sac.FILENAME,'_temp_'];
            handles.sac(i).sac.FILENAME=filename;
            writesac(handles.sac(i).sac);
            movefile(filename,[handles.sac(i).filepath,temp]);
        end
    case 'r'
        act='readsacfile_Callback(hObject, eventdata, handles);';
   case 'q'
       close(gcbf);act='return;';
    case { '-', '+'}
        eval(['creat_sacfigure(hObject, eventdata, handles,handles.fnum',key,'1);']);
end
end

=======
function [ act ] = keypress(hObject, eventdata, handles,key)
act='';
name=get(hObject,'Tag');
if handles.pc==2;
switch key
    
    case {'x','o','f','p','s'}
        return;
        
    case 'n'
        handles.figure_index=handles.figure_index+handles.fnum;
        if handles.figure_index>length(handles.sac);
            handles.figure_index=handles.figure_index-handles.fnum;
            state_new(hObject, eventdata, handles,'plotting_done');
        end
        plot_freq(hObject, eventdata, handles);
        guidata(hObject, handles);
    case 'c'
       if ismember({get(hObject,'Tag')},{'state'})
        set(hObject,'String', {'state'},'Value',1);end
       if ismember({get(hObject,'Tag')},{'sacfile_lst'})
        set(hObject,'Value',1);
        set(hObject,'String', {'sacfile list'},'Value',1);end
       if ismember({get(hObject,'Tag')},'plotsac');
        creat_sacfigure(hObject, eventdata, handles,handles.fnum);end
    case 'b'
    if strcmp(name,'plotsac')+strcmp(name,'plot_freq')
    handles.figure_index=handles.figure_index-handles.fnum;
    if  handles.figure_index<=0
        handles.figure_index=1;
        state_new(hObject, eventdata, handles,'plotting_first_one');
    end
    plot_freq(hObject, eventdata, handles);
    if strcmp(name,'plot_freq')
       plot_freq(hObject, eventdata, handles);
    end
    else
        uicontrol(handles.sacfile_browser);
    end
    guidata(hObject, handles);
end
return
end


switch key
    case 'n'
        handles.figure_index=handles.figure_index+handles.fnum;
        if handles.figure_index>length(handles.sac);
            handles.figure_index=handles.figure_index-handles.fnum;
            state_new(hObject, eventdata, handles,'plotting_done');
        end
        guidata(hObject, handles);
        handles=plot_on(hObject, eventdata, handles);
        if strcmp(name,'plot_freq')
           handles=plot_freq(hObject, eventdata, handles);
        end
        guidata(hObject, handles);
    case 'b'
    if strcmp(name,'plotsac') || strcmp(name,'plot_freq')
    handles.figure_index=handles.figure_index-handles.fnum;
    if  handles.figure_index<=0
        handles.figure_index=1;
        state_new(hObject, eventdata, handles,'plotting_first_one');
    end
    handles=plot_on(hObject, eventdata, handles);
    if strcmp(name,'plot_freq')
       plot_freq(hObject, eventdata, handles);
    end
       guidata(hObject, handles);
    else
        uicontrol(handles.sacfile_browser);
    end
    case 'x'
        p = ginput(2);
        if ismember({get(gca,'Tag')},handles.ftag)==0;return;end
        handle=gca;UD=handle.UserData;
        UD.ax(1)=min(p(:,1));
        UD.ax(2)=max(p(:,1));
        set(gca,'UserData',UD);
        guidata(hObject, handles);
        axis_update2( hObject,UD,handles);
        handles.fax(1)=min(handles.fax(1),UD.ax(1));handles.fax(2)=max(handles.fax(2),UD.ax(2));
        guidata(hObject,handles);
    case 'o'
        for i=1:handles.fnum
            name=handles.ftag{i};
            eval(['temp=handles.',name,';']);
            UD=temp.UserData;
            if UD.pindex>1
            p=UD.point(UD.pindex-1).p;
            UD.pindex=UD.pindex-1;
            UD.ax(1)=min(p(:,1));
            UD.ax(2)=max(p(:,1));
            set(temp,'UserData',UD);
            set(temp,'XLim',UD.ax(1:2));
            guidata(hObject, handles);
            end
        end
    case {'f','p','s'}
        if ismember({get(hObject,'Tag')},{'plotsac','figure1'})
            p = ginput(1);hold on;
            if ismember({get(gca,'Tag')},handles.ftag)==0;return;end
            handle=gca;UD=handle.UserData;
            switch key
                
                case 'f'
                   handles.sac(UD.figure_index).sac.F=p(1);temp='F';
                case 'p'
                    handles.sac(UD.figure_index).sac.A=p(1);temp='P';
                case 's'
                    handles.sac(UD.figure_index).sac.T0=p(1);temp='S';
            end
            
        Y=get(gca,'Ylim');
        h1=plot([p(1),p(1)],[Y(1)*0.8,Y(2)*0.8],'r');text(p(1),Y(2)*0.9,temp);hold off;
        try set(get(get(h1, 'Annotation'), 'LegendInformation'), 'IconDisplayStyle', 'off');end
        guidata(hObject, handles);
        end
   case handles.ret
       %[name,'_Callback(hObject, eventdata, handles)']
        act=[name,'_Callback(hObject, eventdata, handles);'];
   case 'c'
       if ismember({get(hObject,'Tag')},{'state'})
        set(hObject,'String', {'state'},'Value',1);end
       if ismember({get(hObject,'Tag')},{'sacfile_lst'})
        set(hObject,'String', {'sacfile list'},'Value',1);end
       if ismember({get(hObject,'Tag')},'plotsac');
        creat_sacfigure(hObject, eventdata, handles,handles.fnum);end
    case 'w'
        temp='_temp';
        if handles.wo==1
            temp='';
        end
        for i=1:length(handles.sac)
            filename=[handles.sac(i).sac.FILENAME,'_temp_'];
            handles.sac(i).sac.FILENAME=filename;
            writesac(handles.sac(i).sac);
            movefile(filename,[handles.sac(i).filepath,temp]);
        end
    case 'r'
        act='readsacfile_Callback(hObject, eventdata, handles);';
   case 'q'
       close(gcbf);act='return;';
    case { '-', '+'}
        eval(['creat_sacfigure(hObject, eventdata, handles,handles.fnum',key,'1);']);
end
end

>>>>>>> d2ee5a95b3f5d2249402dcd2cdb9c1d71fc75ff4
