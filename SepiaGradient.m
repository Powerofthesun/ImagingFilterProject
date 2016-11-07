function [ imOut ] = SepiaGradient( I )
%Graident filter
I=im2double(I);
I=I-0.1;
edgeGradRed=[0.42 0.42 0.42 0.42 0.42; 0.42 0.05 0 0.05 0.42; 0.42 0.05 0 0.05 0.42; 0.42 0.05 0 0.05 0.42; 0.42 0.42 0.42 0.42 0.42];
edgeGradGreen=[0.25 0.25 0.25 0.25 0.25; 0.25 0.05 0 0.05 0.25; 0.25 0.05 0 0.05 0.25; 0.25 0.05 0 0.05 0.25; 0.25 0.25 0.25 0.25 0.25];
edgeGradBlue=[0.07 0.07 0.07 0.07 0.07; 0.07 0.05 0 0.05 0.07; 0.07 0.05 0 0.05 0.07; 0.07 0.05 0 0.05 0.07; 0.07 0.07 0.07 0.07 0.07];

imOut=I+imresize(cat(3, edgeGradRed, edgeGradGreen, edgeGradBlue), size(I(:,:,1)), 'bilinear');
end


