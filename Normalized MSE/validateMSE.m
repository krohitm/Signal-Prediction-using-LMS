function [ J,yfinal ] = validateMSE( input, desired, W, M, alpha )
%This is the second step.
%this function finds the Mean Squared error for the various filter coefficients
%the purpose here is to find the best fitting set of parameters
for i=1:size(M,2)
    for k=1:size(alpha,2)
        w=(i-1)*size(alpha,2)+k;
        X=zeros(M(i),size(input,1)-M(i));
        for j=1:size(input,1)-M(i)
            X(1:M(i),j)=input(j+M(i)-1:-1:j);
        end;
        Wcurr=W(1:M(i),w);  %taking only wth filter coefficients
        y=Wcurr.'*X;    %(1:M(i),1:size(desired)-M(i));
        y=y.';
        J(i,k)=immse(y,desired(M(i)+1:size(desired)));  %the prediction y is starting only for (M+1)st and beyond output signals 
        yfinal(1:size(y),w)=y;
    end;
end;
end