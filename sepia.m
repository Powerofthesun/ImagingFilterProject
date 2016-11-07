function [ outIm ] = sepia( I )
%SepiaFilter
I=im2double(I);
I=rgb2gray(I);
red=I;
red=red+0.43;
green=I;
green=green+0.25;
blue=I;
blue=blue+0.07;
I=cat(3, red,green,blue);
outIm=I;
end

