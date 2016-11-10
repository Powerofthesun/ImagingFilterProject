function [ outIm ] = GreenGrad( I )
%Creates an artsy green filter
I=im2double(I);
redfilter=[0.2 0.2 0.2;0.2 0.2 0.2; 0.2 0.2 0.2];
greenfilter=[0.4 0.4 0.4; 0.35 0.35 0.35; 0.3 0.3 0.3];
bluefilter=[0.25 0.25 0.25; 0.3 0.3 0.3 ; 0.35 0.35 0.35];
filter=imresize(cat(3, redfilter, greenfilter,bluefilter), [size(I,1) size(I,2)]);
colortrans = 0.4;
imgEnhanced=I;
for ii = 1:3
   imgEnhanced(:,:,ii) = I(:,:,ii)*(1-colortrans) + im2double(filter(:,:,ii))*colortrans;
end
outIm=imgEnhanced;
end

