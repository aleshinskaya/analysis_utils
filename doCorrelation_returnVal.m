function [rVal] = doCorrelation(x,y,filter,description,showPlot)
%doCorrelation(x,y,filter,description,showPlot)

filter2= ~isnan(x) & ~isnan(y);
[rVal,pVal]=corr( x(filter & filter2), y(filter & filter2));
df= sum(filter)-2;

% fprintf('\n     %s r(%d) = %.2f, p = %.3f\n',description,df,rVal,pVal)

if(showPlot)
    
    F1 = figure('Color','White');
    scatter(x(filter & filter2), y(filter & filter2));
    lsline;
end

end