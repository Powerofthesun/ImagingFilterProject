function [ imOut ] = PointilismFilter( I, whiteness )
%Tries to replicate the pointilism art style
I=im2double(I);
imOut=I;
for i=1:size(I,1)
    for j=1:size(I,2)
        if (mod(i,3)==0) && (mod(j,3)==0)
            for k=1:3
                inputPoint=imOut(i,j,k);
                imOut(i+1,j,k)=inputPoint+whiteness;
                imOut(i-1,j,k)=inputPoint+whiteness;
                imOut(i+1,j+1,k)=inputPoint+whiteness;
                imOut(i-1,j+1,k)=inputPoint+whiteness;
                imOut(i+1,j-1,k)=inputPoint+whiteness;
                imOut(i-1,j-1,k)=inputPoint+whiteness;
                imOut(i,j+1,k)=inputPoint+whiteness;
                imOut(i,j-1,k)=inputPoint+whiteness;
            end
            
        end
    end
end
end

