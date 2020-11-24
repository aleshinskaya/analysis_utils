function makePlotFancy(X,FILT,names,clr)
% makePlot(X, FILT, names, color)
% X is a column vector
%FILT is also a column vector
%filters applied according to columns
%lengths must match but filters can sum to different values per column
%filter is POSITIVE ie 1= include, 0=exclude
%names is a cell array

[n,numCond] =size(X);
dotInc = .03

if(strcmp(clr,'yellow'))
    clr = [249,217,10]/255;
else
    clr= [132,132,215]/255;
end


%create vector of SEs for each of the columns in X
SE = [];
xMEAN = [];
xALL = [];
filtN = [];
for c=1:numCond
    
    curX = X(:,c);
    curFilt = FILT(:,c) & ~isnan(curX);
    curN=sum(curFilt);
    filtN(c) = curN;
    filtX = curX(curFilt);
    SE(c) = std(filtX/sqrt(curN-1));
    xMEAN(c) = mean(filtX);
    xALL(:,c) = filtX;
    
end



%plot this
F1 = figure('Color','White');
errorbar_groups(xMEAN,SE,'bar_names',...
    names,'bar_colors',[clr],'FigID',F1);
set(gca,'Color',[0.8 0.8 0.8]);
set(gca,'FontSize',20);
axis([0,numCond+1,min(min(X)),max(max(X))]) 
hold on



for c=1:numCond
    cInd = c-1;
    %get the data and sort by values
    curDatSort = sort(xALL(:,c));
    %round it to nearest 3rd decimal
    curDatSortRound = round(curDatSort,3);
    %get unique values
    datUnique = unique(curDatSortRound);
    %how many different values are there?
    nUnique = length(datUnique);   

    %add each 'layer' to scatterplot in order
    for n=1:nUnique
        uData = curDatSortRound(curDatSortRound==datUnique(n));
        nPoints = length(uData);
        %this affects offsets. Total bar width/nUnique
%       
        if(mod(nPoints,2)==0)  %even number points...
            incr = dotInc*(nPoints/2);      
            yVals = [c-incr:dotInc:c+incr];        
            yVals(yVals==c) = [];
        else %odd number of points
            incr = dotInc*((nPoints-1)/2);      
            yVals = [c-incr:dotInc:c+incr];                  
        end
     
        %each datapoint gets an offset y pos but same value
        for u=1:length(uData)
            scatter(yVals(u),datUnique(n),10,'blue')
        end
    end
end