function[]=plotoutput(W,input,desired)
%this function is used to plot the function on the basis of the learned model, against the actual model.

M=size(W,1);
for j=1:(size(input,1)-M)
    X(1:M,j)=input(j+M-1:-1:j);
end;
y=W.'*X;
figure2 = figure;
plot(1+M:size(y,2)+M,y(1,:));
hold on;
plot(1:size(desired,1),desired);
xlabel ('time index (t)');
ylabel ('signal');
title ('actual signal against predicted signal');
legend ('predicted signal', 'actual signal');
end