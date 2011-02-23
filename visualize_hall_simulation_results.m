close all

data = SBmeasurement('datasets/Hall data for sbtoolbox.xls');
[time,componentNames,values,minvalues,maxvalues] = SBmeasurementdata(data{1}); % data{1} is U112
E = (maxvalues - minvalues)/2;
[I,J] = ind2sub(size(E),find(isnan(E)));
E(I,J) = 0;

sharma_data = SBmeasurement('datasets/Sharma data for sbtoolbox.xls');
[sharma_time,sharma_componentNames,sharma_values,sharma_minvalues,sharma_maxvalues] = SBmeasurementdata(sharma_data{2}); % 2 is the WT
sharma_E = (sharma_maxvalues - sharma_minvalues)/2;
[I,J] = ind2sub(size(sharma_E),find(isnan(sharma_E)));
sharma_E(I,J) = 0;

load('hall_simulation_results')
t = results(:,1);
m = results(:,2);
dc = results(:,3);
nk = results(:,4);
mono = results(:,5);
monoblood = results(:,6);
rhop = results(:,7);
n = results(:,8);
pn = results(:,9);
np = results(:,10);
ic = results(:,11);
aic = results(:,12);
dca = results(:,13);
mp = results(:,14);
rmigmonoblood = results(:,15);
rphmono = results(:,16);
mcp3 = results(:,17);
p_experimental = results(:,18);
monop = results(:,19);
pmono = results(:,20);
atii = results(:,21);
patii = results(:,22);
atiip = results(:,23);
mcp3_tmp = results(:,24);
rinfatii = results(:,25);
ifng = results(:,26);
groa = results(:,27);
groa_tmp = results(:,28);
il18_tmp = results(:,29);

set(0,'DefaultFigureWindowStyle','docked');

% figure;
% subplot(3,1,1);
% plot(t,rmigmonoblood);
% title('RmigMonoBlood');
% subplot(3,1,2);
% plot(t,mcp1,t,mcp1_tmp);
% title('MCP-1');
% subplot(3,1,3);
% plot(t,mcp3);
% title('MCP-3');
% set(gcf,'name','RmigMonoBlood');

figure;
subplot(1,1,1);
exp_inxs = find(strcmp(sharma_componentNames,'MCP3'));
% exp_inxs = find(strcmp(componentNames,'M_infected'));
res = barweb(sharma_values(:,exp_inxs),sharma_E(:,exp_inxs),0.9,sharma_time,[],[],[],[], [],{'MCP3'},'plot');
set(res.bars,'facecolor',[0.7,0.7,0.7]);
hold on
y = mcp3_tmp; % Zero subtracted out
plot(t,y,'linewidth',4,'color','k');
yl = ylim; yl(1) = min([yl(1),y']); yl(2) = max([yl(2),y']); ylim(yl);
title('MCP3');
hold off
set(gcf,'name','MCP3');

figure;
subplot(2,1,1);
exp_inxs = find(strcmp(componentNames,'ATII'));
% exp_inxs = find(strcmp(componentNames,'M_infected'));
res = barweb(values(:,exp_inxs),E(:,exp_inxs),0.9,time,[],[],[],[], [],{'ATII'},'plot');
set(res.bars,'facecolor',[0.7,0.7,0.7]);
hold on
y = atii + atiip;
plot(t,y,'linewidth',4,'color','k');
yl = ylim; yl(1) = min([yl(1),y']); yl(2) = max([yl(2),y']); ylim(yl);
title('ATII');
set(gcf,'name','M');
hold off
subplot(2,1,2);
exp_inxs = find(strcmp(componentNames,'Infected_ATII'));
res = barweb(values(:,exp_inxs),E(:,exp_inxs),0.9,time,[],[],[],[], [],{'Infected_ATII'},'plot');
set(res.bars,'facecolor',[0.7,0.7,0.7]);
hold on
y = atiip;
plot(t,y,'linewidth',4,'color','k');
yl = ylim; yl(1) = min([yl(1),y']); yl(2) = max([yl(2),y']); ylim(yl);
title('ATII');
set(gcf,'name','ATII');
hold off

% figure;
% plot(t,rinfatii,'linewidth',4,'color','k');
% title('RinfATII');
% set(gcf,'name','RinfATII');

figure;
subplot(2,1,1);
exp_inxs = find(strcmp(componentNames,'M'));
exp_inxs(end+1) = find(strcmp(componentNames,'Alveolar_M'));
res = barweb(sum(values(:,exp_inxs),2),sqrt(sum(E(:,exp_inxs).^2,2)),0.9,time,[],[],[],[], [],{'M'},'plot');
set(res.bars,'facecolor',[0.7,0.7,0.7]);
hold on
y = m + mp;
plot(t,y,'linewidth',4,'color','k');
yl = ylim; yl(1) = min([yl(1),y']); yl(2) = max([yl(2),y']); ylim(yl);
title('Machrophage');
set(gcf,'name','M');
hold off
subplot(2,1,2);
exp_inxs = find(strcmp(componentNames,'Infected_M'));
exp_inxs(end+1) = find(strcmp(componentNames,'Infected_Alveolar_M'));
% exp_inxs = find(strcmp(componentNames,'M_infected'));
res = barweb(sum(values(:,exp_inxs),2),sqrt(sum(E(:,exp_inxs).^2,2)),0.9,time,[],[],[],[], [],{'Infected M'},'plot');
set(res.bars,'facecolor',[0.7,0.7,0.7]);
hold on
y = mp;
plot(t,y,'linewidth',4,'color','k');
yl = ylim; yl(1) = min([yl(1),y']); yl(2) = max([yl(2),y']); ylim(yl);
title('Machrophage');
set(gcf,'name','M');
hold off
% legend('M','Exp M','MP','Exp MP');

figure;
exp_inxs = find(strcmp(componentNames,'DC'));
exp_inxs(end+1) = find(strcmp(componentNames,'Big_DC'));
res = barweb(sum(values(:,exp_inxs),2),sqrt(sum(E(:,exp_inxs).^2,2)),0.9,time,[],[],[],[], [],{'DC'},'plot');
set(res.bars,'facecolor',[0.7,0.7,0.7]);
hold on
y = dc + dca;
plot(t,y,'linewidth',4,'color','k');
yl = ylim; yl(1) = min([yl(1),y']); yl(2) = max([yl(2),y']); ylim(yl);
title('DC');
set(gcf,'name','DC');
hold off

figure;
exp_inxs = find(strcmp(componentNames,'P'));
% exp_inxs = find(strcmp(componentNames,'M_infected'));
res = barweb(values(:,exp_inxs),E(:,exp_inxs),0.9,time,[],[],[],[], [],{'P'},'plot');
set(res.bars,'facecolor',[0.7,0.7,0.7]);
hold on
plot(t,p_experimental,'linewidth',4,'color','k');
yl = ylim; yl(1) = min([yl(1),y']); yl(2) = max([yl(2),y']); ylim(yl);
title('Pathogen');
set(gcf,'name','P');
hold off


figure;
subplot(3,1,1);
exp_inxs = find(strcmp(componentNames,'Mono'));
% exp_inxs = find(strcmp(componentNames,'M_infected'));
res = barweb(values(:,exp_inxs),E(:,exp_inxs),0.9,time,[],[],[],[], [],{'Mono'},'plot');
set(res.bars,'facecolor',[0.7,0.7,0.7]);
hold on
y = mono;
plot(t,y,'linewidth',4,'color','k');
yl = ylim; yl(1) = min([yl(1),y']); yl(2) = max([yl(2),y']); ylim(yl);
title('Mono');
set(gcf,'name','M');
hold off
subplot(3,1,2);
y = monoblood;
plot(t,y,'linewidth',4,'color','k');
yl = ylim; yl(1) = min([yl(1),y']); yl(2) = max([yl(2),y']); ylim(yl);
title('MonoBlood');
subplot(3,1,3);
exp_inxs = find(strcmp(componentNames,'Infected_Mono'));
% exp_inxs = find(strcmp(componentNames,'M_infected'));
res = barweb(values(:,exp_inxs),E(:,exp_inxs),0.9,time,[],[],[],[], [],{'Infected_Mono'},'plot');
set(res.bars,'facecolor',[0.7,0.7,0.7]);
hold on
y = monop;
plot(t,y,'linewidth',4,'color','k');
yl = ylim; yl(1) = min([yl(1),y']); yl(2) = max([yl(2),y']); ylim(yl);
title('MonoP');
set(gcf,'name','Momo');

figure;
plot(t,ifng,'linewidth',4,'color','k');
title('IFNG');
set(gcf,'name','IFNG');

figure;
subplot(1,1,1);
exp_inxs = find(strcmp(sharma_componentNames,'GROA'));
% exp_inxs = find(strcmp(componentNames,'M_infected'));
res = barweb(sharma_values(:,exp_inxs),sharma_E(:,exp_inxs),0.9,sharma_time,[],[],[],[], [],{'GROA'},'plot');
set(res.bars,'facecolor',[0.7,0.7,0.7]);
hold on
y = groa_tmp; % Zero subtracted out
plot(t,y,'linewidth',4,'color','k');
yl = ylim; yl(1) = min([yl(1),y']); yl(2) = max([yl(2),y']); ylim(yl);
title('GROA');
hold off
set(gcf,'name','GROA');

figure;
subplot(2,1,1);
exp_inxs = find(strcmp(componentNames,'N'));
res = barweb(values(:,exp_inxs),E(:,exp_inxs),0.9,time,[],[],[],[], [],{'N'},'plot');
set(res.bars,'facecolor',[0.7,0.7,0.7]);
hold on
y = n + np;
plot(t,y,'linewidth',4,'color','k');
yl = ylim; yl(1) = min([yl(1),y']); yl(2) = max([yl(2),y']); ylim(yl);
title('Neutrophil');
set(gcf,'name','N');
hold off
subplot(2,1,2);
exp_inxs = find(strcmp(componentNames,'Infected_N'));
% exp_inxs = find(strcmp(componentNames,'M_infected'));
res = barweb(values(:,exp_inxs),E(:,exp_inxs),0.9,time,[],[],[],[], [],{'Infected_N'},'plot');
set(res.bars,'facecolor',[0.7,0.7,0.7]);
hold on
y = np;
plot(t,y,'linewidth',4,'color','k');
yl = ylim; yl(1) = min([yl(1),y']); yl(2) = max([yl(2),y']); ylim(yl);
title('Neutrophil');
set(gcf,'name','N');
hold off

figure;
subplot(1,1,1);
exp_inxs = find(strcmp(sharma_componentNames,'IL18'));
% exp_inxs = find(strcmp(componentNames,'M_infected'));
res = barweb(sharma_values(:,exp_inxs),sharma_E(:,exp_inxs),0.9,sharma_time,[],[],[],[], [],{'IL18'},'plot');
set(res.bars,'facecolor',[0.7,0.7,0.7]);
hold on
y = il18_tmp; % Zero subtracted out
plot(t,y,'linewidth',4,'color','k');
yl = ylim; yl(1) = min([yl(1),y']); yl(2) = max([yl(2),y']); ylim(yl);
title('IL18');
hold off
set(gcf,'name','IL18');


% legend('M','Exp M','MP','Exp MP');
% subplot(3,2,2);
% plot(t,dc+dca,'k');
% hold on
% plot(t,dc,'m');
% plot(t,dca,'r');
% title('Dendritic Cell');
% exp_inx = find(strcmp(componentNames,'DC'));
% errorbar(time,values(:,exp_inx),(maxvalues(:,exp_inx)-minvalues(:,exp_inx))/2,'color','b');
% exp_inx = find(strcmp(componentNames,'DC_activated'));
% plot(time,values(:,exp_inx),'-*b');
% hold off
% legend('DC & DCA','DC','DCA','Exp DC & DCA','Exp DCA');
% 
% subplot(3,2,3);
% plot(t,n+np,'k');
% hold on
% plot(t,n,'m');
% plot(t,np,'r');
% title('Neutrophil');
% exp_inx = find(strcmp(componentNames,'N'));
% errorbar(time,values(:,exp_inx),(maxvalues(:,exp_inx)-minvalues(:,exp_inx))/2,'color','b');
% exp_inx = find(strcmp(componentNames,'N_infected'));
% plot(time,values(:,exp_inx),'-*b');
% hold off
% legend('N & NP','N','NP','Exp N & NP','Exp NP');
% 
% 
% subplot(3,2,4);
% plot(t,mono,'k',t,monoblood,'m');
% title('Monocytes');
% exp_inx = find(strcmp(componentNames,'Mono'));
% hold on
% plot(time,values(:,exp_inx),'-*b');
% %errorbar(time,values(:,exp_inx),(maxvalues(:,exp_inx)-minvalues(:,exp_inx))/2,'color','b');
% hold off
% legend('Mono','MonoBlood','Exp Mono');
% 
% subplot(3,2,5);
% plot(t,rhop,'k');
% title('rho P');
% 
% % subplot(3,2,6);
% % hs = [];
% % % hs = plot(t,ifng,t,il1a);
% % hold on
% % exp_inxs = [];
% % exp_inxs(end+1) = find(strcmp(sharma_componentNames,'IFNG'));
% % exp_inxs(end+1) = find(strcmp(sharma_componentNames,'IL1A'));
% % exp_hs = plot(repmat(sharma_time,1,length(exp_inxs)),sharma_values(:,exp_inxs));
% % set(exp_hs,'marker','*');
% % hold off
% % title('Cytokines');
% % legend([hs;exp_hs],{'IFNG','IL1','Exp IFNG','Exp IL1A'});

set(0,'DefaultFigureWindowStyle','normal');