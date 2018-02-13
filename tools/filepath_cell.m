function [ temp ] = filepath_cell(  )

[filename,pathname,fileindex]=uigetfile('*.*','MultiSelect','on');
if fileindex==0
    return
end
%[m,~]=size(filename);
if ischar(filename)
    filename1=filename;
    filename=cell(0,0);filename{1,1}=filename1;
end
temp{1}='ppk';temp{2}='3';temp{3}='r';
for i=1:length(filename)
    tfname=filename{i};
    temp{i+3}=[pathname,tfname];
end
end

