function [ outIm ] = Bright( I )
%uses imadjust to fix color constrast
imgEnhanced = imadjust(I,[0; 0.5],[0; 1], 1);
outIm=imgEnhanced;

end

