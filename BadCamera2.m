function [ imOut ] = BadCamera2( I ,factor)
%Graident filter
I=im2double(I);
I=I-factor;
edgeGradRed=[0.31 0.31 0.31 0.31 0.31; 0.31 0.05 0 0.05 0.31; 0.31 0.05 0 0.05 0.31; 0.31 0.05 0 0.05 0.31; 0.31 0.31 0.31 0.31 0.31];
edgeGradGreen=[0.16 0.16 0.16 0.16 0.16; 0.16 0.05 0 0.05 0.16; 0.16 0.05 0 0.05 0.16; 0.16 0.05 0 0.05 0.16; 0.16 0.16 0.16 0.16 0.16];
edgeGradBlue=[0.1 0.1 0.1 0.1 0.1; 0.1 0.05 0 0.05 0.1; 0.1 0.05 0 0.05 0.1; 0.1 0.05 0 0.05 0.1; 0.1 0.1 0.1 0.1 0.1];

temp=imresize(cat(3, edgeGradRed, edgeGradGreen, edgeGradBlue), size(I(:,:,1)), 'bilinear');
temp(:,:,:)=1-temp(:,:,:);
imshow(temp);
imOut=I+temp;
end


