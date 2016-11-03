function [ imOut ] = PointilismFilter( I )
%Tries to replicate the pointilism art style
I=im2double(I);
[a,b]=size(I(:,:,1));
imOut=I;
p=0;
for i=1:a
    for j=1:b
        if (mod(i,2)==0) && (mod(j,2)==0)
            p=p+1;
            imOut(i:j)=1;
        end
    end
end
end

