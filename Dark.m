function [ outIm ] = Dark( I )
%Darkens the image
imgEnhanced = imadjust(I,[0; 1],[0; 0.5], 1);
outIm=imgEnhanced;

end

