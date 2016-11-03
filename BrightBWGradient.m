function [ outIm ] = BrightBWGradient( I )
%A bright BW gradient
I2=EdgeGradient(I);
outIm=BWHighContrast(I2);


end

