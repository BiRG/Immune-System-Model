% addpath('kmedoids');
data = SBmeasurement('Hall data for sbtoolbox.xls')

[time,componentNames,values,minvalues,maxvalues] = SBmeasurementdata(data);
times = [];
for i = 1:length(componentNames)
    times(:,i) = time;
end
[m,n] = size(values);

idx = kmeans(values',k);
%idx = cluster(Z,'cutoff',1);
%k = max(idx);
h=figure(1);
axs = [];
for i = 1:n
    subplot(ceil(n/3),3,i);
    ixs = i;
    %hs = plot(times(:,ixs),values(:,ixs));
    labels = times(:,1);
    Y = values(:,ixs);
    E = maxvalues(:,ixs) - values(:,ixs);
    [I,J] = ind2sub(size(E),find(isnan(E)));
    E(I,J) = 0;
    if length(ixs) == 1
%         hs = errorbar(times(:,ixs),Y,E);
        handles = barweb(Y,E,0.9,labels,[],[],[],[], [],componentNames(:,ixs),'plot');
    else
        handles = barweb(Y,E,0.9,labels,[],[],[],[], [],componentNames(:,ixs),'plot');
    end
%         if length(ixs) > 1
%             h_mean = line(times(:,1),mean(values(:,ixs),2),'linewidth',3,'color','k');
%         end
%     if length(ixs) == 1
%         set(hs,'marker','s');
%         set(hs,'linestyle','none');
%         set(hs,'markersize',12);
%         set(hs,'markerfacecolor','k');
%         set(hs,'markeredgecolor','k');
%         legend(componentNames(:,ixs),'Location','Northwest','interpreter','none');
%     end
    axs(end+1) = gca;
end
set(h,'name','Hall Experimental');
%     linkaxes(axs);