function [ outIm ] = Warhol( I, facing )
%Creates a Warhol image
%Credit Matlab
SE = strel('Disk',18);
imgEnhanced = imsubtract(imadd(I,imtophat(I,SE)),imbothat(I,SE));
imgEnhanced1 = imadjust(imgEnhanced,[0.00 0.00 0.00; 1.00 0.38 0.40],[1.00 0.00 0.70; 0.20 1.00 0.40], [4.90 4.00 1.70]);
imgEnhanced2 = imadjust(imgEnhanced,[0.13 0.00 0.30; 0.75 1.00 1.00],[0.00 1.00 0.50; 1.00 0.00 0.27], [5.90 0.80 4.10]);
imgEnhanced3 = imadjust(I,[0.20 0.00 0.09; 0.83 1.00 0.52],[0.00 0.00 1.00; 1.00 1.00 0.00], [1.10 2.70 1.00]);
imgEnhanced4 = imadjust(I,[0.20 0.00 0.00; 0.70 1.00 1.00],[1.00 0.90 0.00; 0.00 0.90 1.00], [1.30 1.00 1.00]);
if facing=='r'
    r = fliplr(imgEnhanced2(:,:,1));
    g = fliplr(imgEnhanced2(:,:,2));
    b = fliplr(imgEnhanced2(:,:,3));
    r2 = fliplr(imgEnhanced4(:,:,1));
    g2 = fliplr(imgEnhanced4(:,:,2));
    b2 = fliplr(imgEnhanced4(:,:,3));
    imgEnhanced2 = cat(3,r,g,b);
    imgEnhanced4=cat(3,r2,g2,b2);
elseif facing == 'l'
    r = fliplr(imgEnhanced1(:,:,1));
    g = fliplr(imgEnhanced1(:,:,2));
    b = fliplr(imgEnhanced1(:,:,3));
    r2 = fliplr(imgEnhanced3(:,:,1));
    g2 = fliplr(imgEnhanced3(:,:,2));
    b2 = fliplr(imgEnhanced3(:,:,3));
    imgEnhanced1 = cat(3,r,g,b);
    imgEnhanced3=cat(3,r2,g2,b2);
end
CompositeImage = [imgEnhanced1 imgEnhanced2; imgEnhanced3 imgEnhanced4]; % (Images 2 and 4 are flipped plane-by-plane.)
outIm=CompositeImage;
end

