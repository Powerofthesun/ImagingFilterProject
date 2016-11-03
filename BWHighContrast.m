function [ outImage ] = BWHighContrast( I )
%Takes a regular image and produces a high contrast grayscale image
outImage=histeq(rgb2gray(I));

end

