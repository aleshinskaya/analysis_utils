function doTTest_btw_fxs(x,y,filterx,filtery,description,tails)
%doTTEST_btw_fxs(x,y,filter-x,filter-y,dscription, tails): must supply COLUMN VECTORS
%x will be filtered by filter-x, y by filter-y
% runs a between-subjects t-test and returns effect sizes etc


filter_x = filterx & ~isnan(x);
filter_y = filtery & ~isnan(y);

[h,p,c,stats]=ttest2(x(filter_x),y(filter_y),.05,tails);
    
    


meanX= mean(x(filter_x)-mean(y(filter_y)));
eff = mes(x(filter_x),y(filter_y),'hedgesg');
efSize = eff.hedgesg;

n_x = sum(filter_x);    
meanX = mean(x(filter_x));
SEx = std(x(filter_x))/sqrt(n_x-1) ;
n_y = sum(filter_y);  
meanY = mean(y(filter_y));
SEy = std(y(filter_y))/sqrt(n_y-1);
    



fprintf('\n     %s: mean-x %.4f, SE -x = %.4f,  mean-y %.4f, SE-y = %.4f, CI [%.4f, %.4f], with t(%d) = %.2f, p = %.5f, d = %.2f\n',...
    description,meanX,SEx,meanY,SEy,c(1),c(2),stats.df,stats.tstat,p,efSize)



%     curX = X(:,c);
%     curFilt = FILT(:,c) & ~isnan(curX);
%     curN=sum(curFilt);
%     filtX = curX(curFilt);

end