function [ outIm ] = ColorIsolation( I, color )
%Isolates by color
I=im2double(I);
hsvin=rgb2hsv(I);

h1=hsvin(:,:,1);
h2=hsvin(:,:,3);

switch color
    case 'blue'
        h2(h1<0.75 & h1>0.55)=0;
    case 'red'
        h2(h1<0.097| h1>0.9)=0;
    case 'green'
        h2(h1<0.5 & h1>0.18)=0;
    otherwise
end

result=cat(3,h1,hsvin(:,:,2),h2); % r2=result(:,:,1);
result=imbinarize(rgb2gray(hsv2rgb(result)),0.05);
for i=1:size(I,1)
    for j = 1:size(I,2)
        calculationr=I(i,j,1);
        calculationg=I(i,j,2);
        calculationb=I(i,j,3);
       if result(i,j)~=0
          for k=1:3
              I(i,j,k)=(calculationr+calculationg+calculationb)/3;
          end
       end
    end
end
outIm=I;
end

