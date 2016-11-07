function [ imOut ] = BadCamera( I,factor )
%Graident filter
I=im2double(I);
I=I-factor;
edgeGrad=[0.35 0.35 0.35 0.35 0.35; 0.35 0.05 0 0.05 0.35; 0.35 0.05 0 0.05 0.35; 0.35 0.05 0 0.05 0.35; 0.35 0.35 0.35 0.35 0.35];
edgeGrad(:,:,:)=1-edgeGrad(:,:,:);
imOut=I+imresize(edgeGrad, size(I(:,:,1)), 'bilinear');
end

