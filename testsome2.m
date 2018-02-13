a=[0:0.01:4];b=sin(a*pi);b=[sin(a*pi),0,0];c=0;
for i=1:1000
    c=[c,b];
end
d=fft(c);
plot(abs(d));
length(d)