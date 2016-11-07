function [ imOut ] = BrushStrokes( I)
%Tries to replicate the pointilism art style
s=4;
I=im2double(I);
imOut=I;
for i=1:size(I,1)
    for j=1:size(I,2)
        if (mod(i,2*s)==0) && (mod(j,2*s)==0)
            for k=1:3
                pixelval=imOut(i,j,k);
                imOut(i,j,k)=pixelval+0.35;
                for l = 0:s-1
                    for m=0:s-1
                        
                        imOut(i+l,j,k)=pixelval+0.35;
                        imOut(i-l,j,k)=pixelval+0.35;
                        imOut(i+l,j+l,k)=pixelval+0.35;
                        imOut(i-l,j-l,k)=pixelval+0.35;
                        imOut(i,j+l,k)=pixelval+0.35;
                        imOut(i,j-l,k)=pixelval+0.35;
                     
                        imOut(i+l,j+m,k)=pixelval+0.35;
                        imOut(i-l,j-m,k)=pixelval+0.35;
                        imOut(i+m,j+l,k)=pixelval+0.35;
                        imOut(i-m,j-l,k)=pixelval+0.35;
                        
                        imOut(i+l,j+m+l,k)=pixelval+0.35;
                        imOut(i-l,j-m+l,k)=pixelval+0.35;
                        imOut(i+l,j+m-l,k)=pixelval+0.35;
                        imOut(i-l,j-m-l,k)=pixelval+0.35;
                        
                    
                        
                        imOut(i+l+m,j+m,k)=pixelval+0.35;
                        imOut(i-l+m,j-m,k)=pixelval+0.35;
                        imOut(i+l-m,j+m,k)=pixelval+0.35;
                        imOut(i-l-m,j-m,k)=pixelval+0.35;
                        
                        imOut(i+l+m,j+m+l,k)=pixelval+0.35;
                        imOut(i-l+m,j-m+l,k)=pixelval+0.35;
                        imOut(i+l-m,j+m-l,k)=pixelval+0.35;
                        imOut(i-l-m,j-m-l,k)=pixelval+0.35;
                        imOut(i,j-m-l,k)=pixelval+0.35;
                        imOut(i+m+m,j-m+l,k)=pixelval+0.35;
                    end
                end
            end
            
        end
    end
end
imOut=WhiteBorder(imOut,4);
end

