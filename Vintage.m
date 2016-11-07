function [ outIm ] = Vintage( I )
%Darkened sepia edge
I=EdgeGradient(I);
I=sepia(I);
outIm=I;
end

