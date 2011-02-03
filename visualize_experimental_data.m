% addpath('kmedoids');
hall_data = SBmeasurement('datasets/Hall data for sbtoolbox.xls');
data = {};
data{1} = create_structure(hall_data);
sdata = struct(hall_data);
data{1}.name = sprintf('%s: %s',sdata.name,sdata.notes);
woolard_data = SBmeasurement('datasets/Woolard data for sbtoolbox.xls');
data{2} = create_structure(woolard_data);
sdata = struct(woolard_data);
data{2}.name = sprintf('%s: %s',sdata.name,sdata.notes);
sharma_data = SBmeasurement('datasets/Sharma data for sbtoolbox.xls');
data{3} = create_structure(sharma_data{2}); % WT
sdata = struct(sharma_data{2});
data{3}.name = sprintf('%s: %s',sdata.name,sdata.notes);
mares_data = SBmeasurement('datasets/Mares data for sbtoolbox.xls');
data{4} = create_structure(mares_data{1});
sdata = struct(mares_data{1});
data{4}.name = sprintf('%s: %s',sdata.name,sdata.notes);
data{5} = create_structure(mares_data{2});
sdata = struct(mares_data{2});
data{5}.name = sprintf('%s: %s',sdata.name,sdata.notes);

ht = java.util.Hashtable();
keys = {};
for i = 1:length(data)  
    for j = 1:length(data{i}.componentNames)
        if ~ht.containsKey(data{i}.componentNames{j})
            ht.put(data{i}.componentNames{j},[i;j]);
            keys{end+1} = data{i}.componentNames{j};
        else
            tmp = ht.get(data{i}.componentNames{j});
            tmp = [tmp [i;j]];
            ht.put(data{i}.componentNames{j},tmp);
        end
    end
end

set(0,'DefaultFigureWindowStyle','docked');
new_hs = [];
for k = 1:length(keys)
    new_hs(end+1) = figure;
    inxs = ht.get(keys{k});
    Y = [];
    E = [];
    names = {};    
    axs = [];
    for ix = 1:size(inxs,2)
        axs(end+1) = subplot(size(inxs,2),1,ix);
        i = inxs(1,ix); j = inxs(2,ix);
        Y = data{i}.values(:,j);
        E = data{i}.maxvalues(:,j)-data{i}.values(:,j);
        [I,J] = ind2sub(size(E),find(isnan(E)));
        E(I,J) = 0;
        hs = barweb(Y,E,0.9,data{i}.time,[],[],[],[], [],names,'plot');
        title(data{i}.name);
    end
    set(new_hs(end),'name',keys{k});    
    linkaxes(axs,'x');
end
set(0,'DefaultFigureWindowStyle','normal');
%     E = [maxvalues_WT(1:end,i)-values_WT(1:end,i) maxvalues_mutant(1:end,i)-values_mutant(1:end,i)];
%     hs = barweb(Y,E,0.9,times_WT(:,i),[],[],[],[], [],{'WT','Mutant'},'plot');
% %     hs = plot(times_WT(:,i),values_WT(:,i),times_mutant(:,j),values_mutant(:,j));
% %     set(hs,'marker','*');
% %     legend('WT','Mutant');
%     title(componentNames_WT{i},'interpreter','none');    
%     set(new_hs(end),'name',componentNames_WT{i});
% end
