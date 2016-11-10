function [ imOut ] = EdgeGradient( I )
%Graident filter
I=im2double(I);
edgeGrad=[0.35 0.35 0.35 0.35 0.35; 0.35 0.05 0 0.05 0.35; 0.35 0.05 0 0.05 0.35; 0.35 0.05 0 0.05 0.35; 0.35 0.35 0.35 0.35 0.35];
imOut=I-imresize(edgeGrad, size(I(:,:,1)), 'bilinear');
end

