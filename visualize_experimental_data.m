close all

data = {};

hall_data = SBmeasurement('datasets/Hall data for sbtoolbox.xls');
for i = 1:length(hall_data)
    data{end+1} = create_structure(hall_data{i});
    sdata = struct(hall_data{i});
    data{end}.name = sprintf('%s: %s',sdata.name,sdata.notes);
    data{end}.sdata = sdata;
end

woolard_data = SBmeasurement('datasets/Woolard data for sbtoolbox.xls');
data{end+1} = create_structure(woolard_data);
sdata = struct(woolard_data);
data{end}.name = sprintf('%s: %s',sdata.name,sdata.notes);
data{end}.sdata = sdata;

sharma_data = SBmeasurement('datasets/Sharma data for sbtoolbox.xls');
data{end+1} = create_structure(sharma_data{2}); % WT
sdata = struct(sharma_data{2});
data{end}.name = sprintf('%s: %s',sdata.name,sdata.notes);
data{end}.sdata = sdata;

% mares_data = SBmeasurement('datasets/Mares data for sbtoolbox.xls');
% data{4} = create_structure(mares_data{1});
% sdata = struct(mares_data{1});
% data{4}.name = sprintf('%s: %s',sdata.name,sdata.notes);
% data{5} = create_structure(mares_data{2});
% sdata = struct(mares_data{2});
% data{5}.name = sprintf('%s: %s',sdata.name,sdata.notes);

unique_notes = {};
ht_unique_notes = java.util.Hashtable();
for i = 1:length(data)  
        if ~ht_unique_notes.containsKey(data{i}.sdata.notes)
            ht_unique_notes.put(data{i}.sdata.notes,i);
            unique_notes{end+1} = data{i}.sdata.notes;
        else
            tmp = ht_unique_notes.get(data{i}.sdata.notes);
            tmp = [tmp i];
            ht_unique_notes.put(data{i}.sdata.notes,tmp);
        end
end

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

% % Grouped by component
% set(0,'DefaultFigureWindowStyle','docked');
% new_hs = [];
% for k = 1:length(keys)
%     new_hs(end+1) = figure;
%     inxs = ht.get(keys{k});
%     Y = [];
%     E = [];
%     names = {};    
%     axs = [];
%     for ix = 1:size(inxs,2)
%         axs(end+1) = subplot(size(inxs,2),1,ix);
%         i = inxs(1,ix); j = inxs(2,ix);
%         Y = data{i}.values(:,j);
%         E = data{i}.maxvalues(:,j)-data{i}.values(:,j);
%         [I,J] = ind2sub(size(E),find(isnan(E)));
%         E(I,J) = 0;
%         hs = barweb(Y,E,0.9,data{i}.time,[],[],[],[], [],names,'plot');
%         title(data{i}.name);
%     end
%     set(new_hs(end),'name',keys{k});    
%     linkaxes(axs,'x');
% end
% set(0,'DefaultFigureWindowStyle','normal');

% Grouped by notes
figure;
for k = 1:length(unique_notes)
    subplot(1,length(unique_notes),k);
    inxs = ht_unique_notes.get(unique_notes{k});
    heat_data = zeros(length(inxs),length(keys)); % rows are datasets, columns are variables
%     cnt = 0;
%     for i = 1:length(inxs)
%         for j = 1:length(keys)
%             if mod(cnt,2) == 0
%                 heat_data(i,j) = 1;
%             end
%             cnt = cnt + 1;
%         end
%     end
    xlabels = {};
    for j = 1:length(keys)
        xlabels{j} = keys{j};
        ixs = ht.get(keys{j});
        for i = 1:length(inxs)
            if ~isempty(find(inxs(i) == ixs(1,:)))
                heat_data(i,j) = 1;
                heat_data(i,j) = length(data{inxs(i)}.sdata.time)
            end
        end
    end
    ylabels = {};
    for i = 1:length(inxs)
        ylabels{end+1} = data{inxs(i)}.sdata.name;
    end
    heatmap(heat_data',ylabels,xlabels,[],'gridlines','-','colormap','red');
    title(unique_notes{k});
end


%     E = [maxvalues_WT(1:end,i)-values_WT(1:end,i) maxvalues_mutant(1:end,i)-values_mutant(1:end,i)];
%     hs = barweb(Y,E,0.9,times_WT(:,i),[],[],[],[], [],{'WT','Mutant'},'plot');
% %     hs = plot(times_WT(:,i),values_WT(:,i),times_mutant(:,j),values_mutant(:,j));
% %     set(hs,'marker','*');
% %     legend('WT','Mutant');
%     title(componentNames_WT{i},'interpreter','none');    
%     set(new_hs(end),'name',componentNames_WT{i});
% end
