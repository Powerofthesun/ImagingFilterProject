function [ outIm ] = SunshineFilter( I )
%Simulates Bright sun
I=im2double(I);
sunshine=[0.1 0.1 0.25 1 1 ; 0.1 0.1 0.25 0.25 0.5; 0.25 0.25 0.25 0.25 0.25 ;0.1 0.1 0.1 0.1 0.1 ;0 0 0 0 0 ];
sunshine=imresize(sunshine, [size(I,1) size(I,2)]);
for i =1:3
    iChannel=I(:,:,i);
    I(:,:,i)=iChannel+sunshine;
end
outIm=I;
end

