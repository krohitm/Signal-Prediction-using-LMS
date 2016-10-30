function[]=learningCurve(M,alpha,input,desired)
%this function plots a graph of the optimum learning rate against 2 smaller
%learning rates to show that the chosen learning rate learns faster
N=size(input,1);
alpha(1)=alpha;
figure3 = figure;
for i=1:3
    W=zeros(M,1);
    for t=1:(N-M)
            X=input(t+M-1:-1:t,1);
            y=W.'*X;               
            error(t,i)=desired(t+M,1)-y; 
            W=W+(alpha(i)*error(t,i)*X)/(X.'*X);
    end;
    plot(1:size(error,1),(error(:,i)).^2);
    alpha(i+1)=alpha(i)-3*(alpha(i)/10);
    hold on;
end;
ylabel('prediction error');
xlabel('Number Of Iterations');
title('Learning Curve for various step sizes');
legend(['learning rate=' num2str(alpha(1))],['learning rate=' num2str(alpha(2))],['learning rate=' num2str(alpha(3))]);
end        