function [ tstr ] = cell2str( tcell )
[m,n]=size(tcell);
for i=1:m
    temp='';
    for j=1:n
        temp1=tcell{i,j};
        temp=[temp,temp1];
    end
    tstr(i,1:length(temp))=temp;
end
end

