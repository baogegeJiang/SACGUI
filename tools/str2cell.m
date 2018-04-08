function [ tcell ] = str2cell( tstr )
[m,n]=size(tstr);
for i=1:m
    count=0;temp='';
   for j=1:n
    if tstr(i,j)==' ';
        if strcmp(temp,'')
            continue
        end
        count=count+1;tcell{i,count}=temp;temp='';continue;
    end
    temp=[temp,tstr(i,j)];
    if j==n
        if strcmp(temp,'')
            continue
        end
        count=count+1;
        tcell{i,count}=temp;temp='';
    end
   end
end

