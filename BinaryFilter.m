function [ outIm ] = BinaryFilter( I, range )
%Binary image filter. Specify threshold from 0 to 1
I2=im2double(I);
outIm=im2bw(I2,range);
end
