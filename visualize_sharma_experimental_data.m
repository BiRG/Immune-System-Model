data = SBmeasurement('Sharma data for sbtoolbox.xls')
data_mutant = data{1}; % Mutant
data_WT = data{2}; % WT

[time,componentNames,values,minvalues,maxvalues] = SBmeasurementdata(data_mutant);
figure(1);
times = [];
for i = 1:length(componentNames)
    times(:,i) = time;
end
[m,n] = size(values);
% values = values - repmat(values(1,:),m,1);
idx = kmeans(values',10);
for i = 1:10
    subplot(5,2,i);
    ixs = find(idx == i);
    plot(times(:,ixs),values(:,ixs));
    legend(componentNames(:,ixs));
end
