function [ outIm ] = CenterTriangle( I,b )
%Creates Artsy triangle in the middle 
I=im2double(I);
triangle=rgb2gray(im2double(imread('triangle.png')));
bwtriangle=imbinarize(triangle);
imshow(bwtriangle);

if b==1
    x=1;
    y=1;
    for i=(size(I,1)/2)-(size(bwtriangle,1)/2):(size(I,1)/2)+(size(bwtriangle,1)/2)-1
        for j =(size(I,2)/2)-(size(bwtriangle,2)/2):(size(I,2)/2)+(size(bwtriangle,2)/2)-1
            for k=1:3
                I(i,j,k)=I(i,j,k)*bwtriangle(x,y);
            end
            y=y+1;
        end
        y=1;
        x=x+1;
    end
    outIm=I;
else
    x=1;
    y=1;
    bwtriangle=1-bwtriangle;
    for i=(size(I,1)/2)-(size(bwtriangle,1)/2):(size(I,1)/2)+(size(bwtriangle,1)/2)-1
        for j =(size(I,2)/2)-(size(bwtriangle,2)/2):(size(I,2)/2)+(size(bwtriangle,2)/2)-1
            for k=1:3
                I(i,j,k)=I(i,j,k)+bwtriangle(x,y);
            end
            y=y+1;
        end
        y=1;
        x=x+1;
    end
    outIm=I;
end
end

