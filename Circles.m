function [ imOut ] = Circles( R,radius,bw )
%Turns image into a series of circles
R=im2double(R);
T=R;
if bw==1
    T=T+1;
else
T=T*0;
end
rows=size(R,1);
colums=size(R,2);
for i=1:radius*2:rows
    for j=radius:radius*2:colums
        
        colorr=R(i,j,1);
        colorg=R(i,j,2);
        colorb=R(i,j,3);
        T=insertShape(T,'FilledCircle',[j i radius],'Color',[colorr colorg colorb],'Opacity',1);
    end     
end
imOut=T;
end


