function [ comp,freq ] = sac_freq( data,delta )
l=length(data);
comp=fft(data);
freq=[1:l]/(l*delta);
end

