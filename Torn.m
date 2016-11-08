function [ imOut ] = Torn( I,w )
%Produces a "Torn" look
tear=rgb2gray(imread('tear.png'));
I=im2double(I);
tear=imresize(tear,[size(I,1) size(I,2)]);
tear=imbinarize(tear);
if w==1
    tear=~tear;
    imOut = I + cat(3, tear, tear, tear);
else
    imOut = I .* cat(3, tear, tear, tear);
end
end

