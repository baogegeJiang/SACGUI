function [ temp ] = browser_add_get_list( temp,filename,pathname )
temp=temp{1,1};
if isempty(temp);
    pre=0;temp=cell(0,0);
elseif strcmp(temp{1,1},{'sacfile list'});pre=0;temp=cell(0,0);
else pre=length(temp);
end

%[~,~]=size(filename);
if ischar(filename)
    filename1=filename;
    filename=cell(0,0);filename{1,1}=filename1;
end
for i=1:length(filename)
    tfname=filename{i};
    temp{pre+i,1}=[pathname,tfname];
end

%temp1=cell2str(temp);temp=temp1;
end

