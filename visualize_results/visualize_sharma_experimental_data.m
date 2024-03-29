% addpath('kmedoids');
data = SBmeasurement('datasets/Sharma data for sbtoolbox.xls')
data_mutant = data{1}; % Mutant
data_WT = data{2}; % WT
data_titles = {'Mutant','WT'};

daxs = [];
for j = 1:length(data)
    [time,componentNames,values,minvalues,maxvalues] = SBmeasurementdata(data{j});
    times = [];
    for i = 1:length(componentNames)
        times(:,i) = time;
    end
    [m,n] = size(values);
    % Normalize
    orig_values = values;
%     values = (values - repmat(values(1,:),m,1))./repmat(std(values),m,1);
%     maxvalues = (maxvalues - repmat(orig_values(1,:),m,1))./repmat(std(orig_values),m,1);
%     minvalues = (minvalues - repmat(orig_values(1,:),m,1))./repmat(std(orig_values),m,1);
    values = (values)./repmat(max(values),m,1);
    maxvalues = (maxvalues)./repmat(max(orig_values),m,1);
    minvalues = (minvalues)./repmat(max(orig_values),m,1);
    %values = (values - repmat(mean(values),m,1))./repmat(std(values),m,1);

    d = pdist(values(1:end-1,:)');
    Z = linkage(d);
    figure(1);
    daxs(end+1) = subplot(2,1,j);
    dendrogram(Z,'labels',componentNames)
    title(data_titles{j});

    k = 6;
    idx = kmeans(values',k);
    %idx = cluster(Z,'cutoff',1);
    %k = max(idx);
    figure(j+1);
    axs = [];
    for i = 1:k
        subplot(ceil(k/2),2,i);
        ixs = find(idx == i);
        %hs = plot(times(:,ixs),values(:,ixs));
        labels = times(:,1);
        Y = values(:,ixs);
        E = maxvalues(:,ixs) - values(:,ixs);
        if length(ixs) == 1
            handles = barweb(Y,E,0.9,labels,[],[],[],[], [],componentNames(:,ixs),'plot');
        else
            handles = barweb(Y,E,0.9,labels,[],[],[],[], [],componentNames(:,ixs),'plot');
        end
%         if length(ixs) > 1
%             h_mean = line(times(:,1),mean(values(:,ixs),2),'linewidth',3,'color','k');
%         end
%         if length(ixs) == 1
%             set(hs,'marker','*');
%             legend(componentNames(:,ixs),'Location','Northwest','interpreter','none');
%         end
        axs(end+1) = gca;
        title(data_titles{j});
    end
%     linkaxes(axs);
end
linkaxes(daxs);

% Now compute the difference between the two
[time_mutant,componentNames_mutant,values_mutant,minvalues_mutant,maxvalues_mutant] = SBmeasurementdata(data_mutant);
times_mutant = [];
for i = 1:length(componentNames_mutant)
    times_mutant(:,i) = time_mutant;
end
[m,n] = size(values_mutant);
% Don't Normalize
% values_mutant = (values_mutant - repmat(mean(values_mutant),m,1))./repmat(std(values_mutant),m,1);
orig_values_mutant = values_mutant;
    
[time_WT,componentNames_WT,values_WT,minvalues_WT,maxvalues_WT] = SBmeasurementdata(data_WT);
times_WT = [];
for i = 1:length(componentNames_WT)
    times_WT(:,i) = time_WT;
end
[m,n] = size(values_WT);
% Don't Normalize
% values_WT = (values_WT - repmat(mean(values_WT),m,1))./repmat(std(values_WT),m,1);
    
saved_j = [];
diff = [];
for i = 1:length(componentNames_WT)
    j = find(strcmp(componentNames_mutant,componentNames_WT{i}));
    saved_j(i) = j;
    diff(i) = sum(abs(values_WT(:,i) - values_mutant(:,j)));
end
[vs,inxs] = sort(diff,'descend');

set(0,'DefaultFigureWindowStyle','docked');
new_hs = [];
for k = 1:length(inxs)
    i = inxs(k);
    j = saved_j(i);
    new_hs(end+1) = figure;
    Y = [values_WT(1:end,i) values_mutant(1:end,i)];
    E = [maxvalues_WT(1:end,i)-values_WT(1:end,i) maxvalues_mutant(1:end,i)-values_mutant(1:end,i)];
    hs = barweb(Y,E,0.9,times_WT(:,i),[],[],[],[], [],{'WT','Mutant'},'plot');
%     hs = plot(times_WT(:,i),values_WT(:,i),times_mutant(:,j),values_mutant(:,j));
%     set(hs,'marker','*');
%     legend('WT','Mutant');
    title(componentNames_WT{i},'interpreter','none');    
    set(new_hs(end),'name',componentNames_WT{i});
end
set(0,'DefaultFigureWindowStyle','normal');

% figure(3)
% exp_inxs = [];
% exp_inxs(end+1) = find(strcmp(sharma_componentNames,'IFNG'));
% exp_hs = plot(repmat(time,1,length(exp_inxs)),orig_values(:,exp_inxs));
% legend('IFNG');