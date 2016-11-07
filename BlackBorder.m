function [ outIm ] = BlackBorder( I,insize )
%Creates a pure blac border around the image
rows=size(I,1);
columns=size(I,2);
I=im2double(I);
if (insize>=rows || insize>=columns)
    outIm=I+2;
    return;  
end
for i = 1:rows
    for j = 1:insize
        I(i,j,:)=0;
        I(i,columns-j+1,:)=0;
    end
end
for i = 1:insize
    for j = 1:columns
        I(i,j,:)=0;
        I(rows-i+1,j,:)=0;
    end
end

outIm=I;
end


