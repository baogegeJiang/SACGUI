function [ handles ] = pickPhase( hObject, eventdata, handles )
global machineIsPhaseG machineIsPG
for i=1:3:length(handles.sac)
            figure_index=i;
            if i+2>length(handles.sac);continue;end
            sacE=handles.sac(figure_index).sac;
            sacN=handles.sac(figure_index+1).sac;
            sacZ=handles.sac(figure_index+2).sac;
            pIndex=0;sIndex=0;
            [data,bSec,delta]=sac2data(sacE,sacN,sacZ);
            bSec=mod(bSec*100,8640000)/100;
            if isnan(handles.sac(figure_index).sac.A)==0
                pIndex=ceil((handles.sac(figure_index).sac.A-bSec)/0.02);
            end
            if isnan(handles.sac(figure_index).sac.T0)==0
                sIndex=ceil((handles.sac(figure_index).sac.T0-bSec)/0.02);
            end
            [pIndex sIndex]=pPickerSingle(pIndex,sIndex,data,[1,1,1,1],...
                machineIsPhaseG,machineIsPG);
            pTime=pIndex*0.02+bSec;
            sTime=sIndex*0.02+bSec;
            %sIndex
            %UD.figure_index
            if pIndex>0
                hold on
                handles.sac(figure_index).sac.A=pTime;
                handles.sac(figure_index+1).sac.A=pTime;
                handles.sac(figure_index+2).sac.A=pTime;
            end
            
            if sIndex>0
                hold on
                handles.sac(figure_index).sac.T0=sTime;
                handles.sac(figure_index+1).sac.T0=sTime;
                handles.sac(figure_index+2).sac.T0=sTime;
            end
            %string{1,1}= sprintf('pick done: %d %d %d',figure_index,figure_index+1,figure_index+2);
            %state_new(hObject, eventdata, handles,string);
         
    
end
guidata(hObject,handles);
string{1,1}='picking done';
state_new(hObject, eventdata, handles,string);
if handles.pc==1
plot_on( hObject, eventdata, handles );
end
end