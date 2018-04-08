function [ output_args ] = state_new( hObject, eventdata, handles,string )

state{:,:}=get(handles.state,'String');

state=state{1,1};if ischar(state);state=str2cell(state);end
[m,~]=size(state);
if ischar(string);string=str2cell(string);end

if strcmp(string,'clear_state');string=cell(0,0);state={'state'};end

[m1,n1]=size(string);
for i=1:m1
    for j=1:n1
        state{i+m,j}=string{i,j};
    end
end
        
set(handles.state,'String',state,'Value',1);
end

