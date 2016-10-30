function[WOpt,k,l,FilterOrder,LearningRate, MSEmin]=runProgram(trainingIn, trainingDes, validateIn, validateDes, testin,testDes)
%this function collectively runs the steps sequentially.

[W,M,alpha]=filterCoeff(trainingIn,trainingDes);
[ MSE,y ] = validateMSE( validateIn, validateDes, W, M, alpha );
[WOpt,k,l]=optimumW(MSE,W,M);
plotMSE(alpha,M,MSE);
plotoutput(WOpt, testin, testDes);
learningCurve(M(k),alpha(l),trainingIn,trainingDes);
FilterOrder = M(k);
LearningRate = alpha(l);
MSEmin = MSE(k,l);

end