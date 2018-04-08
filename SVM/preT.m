function [pre,m]=preT(xt,m)
pre=calValue(m.x,xt,m.a,m.b,m.kernelModel,m.sig2);
m=0;
end
