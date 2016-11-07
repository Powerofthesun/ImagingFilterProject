function [ imOut ] = Sequin( I ,degree)
%Tries to replicate the pointilism art style
I=im2double(I);
imOut=I;
for i=degree:degree:size(I,1)
    for j=degree:degree:size(I,2)
        for k=1:3
            value=imOut(i,j,k);
            for a=i-degree+1:i
                for b=j-degree+1:j
                    imOut(a,b,k)=value+0.25;
                end
            end
        end
    end
end

for i = 1:size(I,1)
    for j =1:size(I,2)
        
    end
end

for i=degree/2:degree:size(I,1)
    for j=degree/2:degree:size(I,2)
        for k=1:3
            imOut(i,j,k)=I(i,j,k);
            imOut(i+1,j,k)=I(i,j,k);
            imOut(i-1,j,k)=I(i,j,k);
            imOut(i,j+1,k)=I(i,j,k);
            imOut(i,j-1,k)=I(i,j,k);
            imOut(i+1,j+1,k)=I(i,j,k);
            imOut(i+1,j-1,k)=I(i,j,k);
            imOut(i-1,j-1,k)=I(i,j,k);
            imOut(i-1,j+1,k)=I(i,j,k);
        end
    end
end
end

