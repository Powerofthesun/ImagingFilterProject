function [ outIm ] = BlueStyle( I )
%Creates blue stylized image
I=im2double(I);
redfilter=[0.5 0.5 0.5 0.5 0.5 ; 0.5 0.2 0 0.2 0.5 ; 0.5 0.2 0 0.2 0.5 ; 0.5 0.2 0 0.2 0.5 ; 0.5 0.5 0.5 0.5 0.5];
greenfilter=[0.59 0.59 0.59 0.59 0.59 ; 0.59 0.3 0 0.3 0.59 ; 0.59 0.3 0 0.3 0.59 ; 0.59 0.3 0 0.3 0.59; 0.59 0.59 0.59 0.59 0.59];
bluefilter = [0.7 0.7 0.7 0.7 0.7 ; 0.7 0.4 0 0.4 0.7 ; 0.7 0.4 0 0.4 0.7 ; 0.7 0.4 0 0.4 0.7 ; 0.7 0.7 0.7 0.7 0.7];
bluefilter=imresize(bluefilter, [size(I,1) size(I,2)]);
redfilter=imresize(redfilter, [size(I,1) size(I,2)]);
greenfilter=imresize(greenfilter, [size(I,1) size(I,2)]);
filter=cat(3, redfilter,greenfilter,bluefilter);
colortrans = 0.4;
imgEnhanced=I;
for ii = 1:3
   imgEnhanced(:,:,ii) = I(:,:,ii)*(1-colortrans) + im2double(filter(:,:,ii))*colortrans;
end
outIm=imgEnhanced;
end

