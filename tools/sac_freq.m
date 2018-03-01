function [ comp,freq ] = sac_freq( data,delta )
l=length(data);
%data=sin((1:length(data))*0.5);
comp=fft(data);
%comp=data;
freq=[1:l]/(l*delta);
end

