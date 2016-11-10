function [ outIm ] = StylizedEdge( I )
%Creates 

imgEnhanced = entropyfilt(I,getnhood(strel('Disk',4)));
imgEnhanced = imgEnhanced/max(imgEnhanced(:));
imgEnhanced = imadjust(imgEnhanced,[0.30; 0.85],[0.90; 0.00], 0.90);
outIm=imgEnhanced;

end

