function [ outIm ] = Reverse( I )
%Stylized filter similar to inverse
outIm = imadjust(I,[0.30; 0.85],[0.90; 0.00], 0.90);

end

