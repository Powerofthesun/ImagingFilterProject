function [ outIm ] = ColorGroup( I, threshold ,colorchoice)
%Creates a segmented image
warning('off','all');
L = bwlabel(imbinarize(rgb2gray(I),threshold));
switch colorchoice
    case 'copper'
        outIm = label2rgb(L,copper(max(L(:))),[0 0 0],'shuffle');
    case 'parula'
        outIm = label2rgb(L,parula(max(L(:))),[0 0 0],'shuffle');
    case 'hsv'
        outIm = label2rgb(L,hsv(max(L(:))),[0 0 0],'shuffle');
    case 'bone'
        outIm = label2rgb(L,bone(max(L(:))),[0 0 0],'shuffle');
    case 'spring'
        outIm = label2rgb(L,spring(max(L(:))),[0 0 0],'shuffle');
    case 'lines'
        outIm = label2rgb(L,lines(max(L(:))),[0 0 0],'shuffle');
    case 'flag'
        outIm = label2rgb(L,flag(max(L(:))),[0 0 0],'shuffle');
    case 'colorcube'
       outIm = label2rgb(L,colorcube(max(L(:))),[0 0 0],'shuffle');
    otherwise
        outIm = label2rgb(L,jet(max(L(:))),[0 0 0],'shuffle');
end

