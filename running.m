function [ handles ] = running( temp,hObject, eventdata, handles)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
if isempty(temp);return;end
if ischar(temp);temp1{1}=temp;temp=temp1;end
for i=1:length(temp)
    line=temp{i};
    com=cutby(line,';');
    for j=1:length(com)
        switch com{j}
            case {'bandpass','filter'}
                handles=filtering( hObject, eventdata, handles);
            case 'readsac'
                handles=read_sac( hObject, eventdata, handles );
                
        end
    end
end
end
