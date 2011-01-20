% addpath('kmedoids');
data = SBmeasurement('Sharma data for sbtoolbox.xls')
data_mutant = data{1}; % Mutant
data_WT = data{2}; % WT
data_titles = {'Mutant','WT'};

for j = 1:length(data)
    [time,componentNames,values,minvalues,maxvalues] = SBmeasurementdata(data{j});
    times = [];
    for i = 1:length(componentNames)
        times(:,i) = time;
    end
    [m,n] = size(values);
    % Normalize
    values = (values - repmat(values(1,:),m,1))./repmat(std(values),m,1);
    orig_values = values;
    %values = (values - repmat(mean(values),m,1))./repmat(std(values),m,1);

    d = pdist(values(1:3,:)');
    Z = linkage(d);
    figure(2*(j-1)+1);
    dendrogram(Z,'labels',componentNames)
    title(data_titles{j});

    % k = 4;
    %idx = kmeans(values',k);
    idx = cluster(Z,'cutoff',1);
    k = max(idx);
    figure(2*(j-1)+2);
    axs = [];
    for i = 1:k
        subplot(ceil(k/2),2,i);
        ixs = find(idx == i);
        hs = plot(times(:,ixs),values(:,ixs));
        if length(ixs) > 1
            h_mean = line(times(:,1),mean(values(:,ixs),2),'linewidth',3,'color','k');
        end
        set(hs,'marker','*');
        legend(componentNames(:,ixs),'Location','Northwest','interpreter','none');
        axs(end+1) = gca;
        title(data_titles{j});
    end
    linkaxes(axs);
end

% figure(3)
% exp_inxs = [];
% exp_inxs(end+1) = find(strcmp(sharma_componentNames,'IFNG'));
% exp_hs = plot(repmat(time,1,length(exp_inxs)),orig_values(:,exp_inxs));
% legend('IFNG');