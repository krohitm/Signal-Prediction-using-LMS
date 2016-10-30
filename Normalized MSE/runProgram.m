function[WOpt,k,l,FilterOrder,LearningRate, MSEmin]=runProgram(trainingInput, trainingDesired, validateInput, validateDesired, testinput,testDesired)
%this function collectively runs the steps sequentially.

[W,M,alpha]=filterCoeff(trainingInput,trainingDesired);
[ MSE,y ] = validateMSE( validateInput, validateDesired, W, M, alpha );
[WOpt,k,l]=optimumW(MSE,W,M);
plotMSE(alpha,M,MSE);
plotoutput(WOpt, testinput, testDesired);
learningCurve(M(k),alpha(l),trainingInput,trainingDesired);
FilterOrder = M(k);
LearningRate = alpha(l);
MSEmin = MSE(k,l);

end