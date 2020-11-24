function makeLinePlot2D(X1,X2,FILT)
% makeLinePlot(X1,X2,FILT)
% X1 is a column vector (each column is a condition, rows are subjects)
% so is X2, it is a second line
% Filt has the same dimensions as X1

[n,numCond] =size(X1);



%create vector of SEs for each of the columns in X
SE_1 = [];
xMEAN_1= [];
for c=1:numCond
    
    curX = X1(:,c);
    curFilt = FILT(:,c) & ~isnan(curX);
    curN=sum(curFilt);
    filtX = curX(curFilt);
    SE_1(c) = std(filtX/sqrt(curN-1));
    xMEAN_1(c) = mean(filtX);
    
end



%create vector of SEs for each of the columns in X
SE_2= [];
xMEAN_2 = [];
for c=1:numCond
    
    curX = X2(:,c);
    curFilt = FILT(:,c) & ~isnan(curX);
    curN=sum(curFilt);
    filtX = curX(curFilt);
    SE_2(c) = std(filtX/sqrt(curN-1));
    xMEAN_2(c) = mean(filtX);
    
end



Y = 1:numCond;


F1 = figure('Color','White');
shadedErrorBar(Y,xMEAN_1,SE_1,'lineprops','-b','transparent',1)
set(gca,'FontSize',20);
hold on
shadedErrorBar(Y,xMEAN_2,SE_2,'lineprops','-g','transparent',1)



