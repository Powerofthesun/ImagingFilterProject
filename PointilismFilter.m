function [ imOut ] = PointilismFilter( I)
%Tries to replicate the pointilism art style
I=im2double(I);
imOut=I;
whiteness=0.2;
for i=1:size(I,1)
    for j=1:size(I,2)
        if (mod(i,3)==0) && (mod(j,3)==0)
            for k=1:3
                inputPoint=imOut(i,j,k);
                imOut(i+1,j,k)=inputPoint;
                imOut(i-1,j,k)=inputPoint;
                imOut(i+1,j+1,k)=inputPoint;
                imOut(i-1,j+1,k)=inputPoint;
                imOut(i+1,j-1,k)=inputPoint;
                imOut(i-1,j-1,k)=inputPoint;
                imOut(i,j+1,k)=inputPoint;
                imOut(i,j-1,k)=inputPoint;
            end
            
        end
    end
end
end

