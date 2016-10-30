function [ W] = parametersOutput( input,desired,M,alpha,W )
%This function is called by the first function filterCoeff.
%this function is being used to get a set of parameter W for a combination
%of Filter Order "M" and regularization parameter "lambda" using the formula W=pinv(R+lambda)*P
N=size(input,1);
for t=1:(N-M)
            X=input(t+M-1:-1:t,1);
            y=W.'*X;               %you can return y to the calling function, and plot and check
            error=desired(t+M,1)-y; %we are trying to predict (t+M)th output signal from t:(t+M-1) input signals
            W=W+(alpha*error*X)/(X.'*X);
        end;
end