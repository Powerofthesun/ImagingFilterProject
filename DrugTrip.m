function [ outIm ] = DrugTrip( I )
%Creates a trippy drug-like effect 
%creating using matlab blog help
drug = decorrstretch(I,'tol',0.02);
outIm=drug;
end

