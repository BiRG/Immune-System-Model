data = SBmeasurement('Hall data for sbtoolbox.xls')
[time,componentNames,values,minvalues,maxvalues] = SBmeasurementdata(data);

sharma_data = SBmeasurement('Sharma data for sbtoolbox.xls')
[sharma_time,sharma_componentNames,sharma_values,sharma_minvalues,sharma_maxvalues] = SBmeasurementdata(sharma_data{2}); % 2 is the WT

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
ifng = results(:,15);
il1a = results(:,16);

figure(1);
subplot(3,2,1);
plot(t,m+mp,'k');
title('Machrophage');
exp_inx = find(strcmp(componentNames,'M'));
hold on
errorbar(time,values(:,exp_inx),(maxvalues(:,exp_inx)-minvalues(:,exp_inx))/2,'color','b');
exp_inx = find(strcmp(componentNames,'M_infected'));
plot(t,mp,'r');
plot(time,values(:,exp_inx),'-*b');
hold off
legend('M','Exp M','MP','Exp MP');

subplot(3,2,2);
plot(t,dc+dca,'k');
hold on
plot(t,dc,'m');
plot(t,dca,'r');
title('Dendritic Cell');
exp_inx = find(strcmp(componentNames,'DC'));
errorbar(time,values(:,exp_inx),(maxvalues(:,exp_inx)-minvalues(:,exp_inx))/2,'color','b');
exp_inx = find(strcmp(componentNames,'DC_activated'));
plot(time,values(:,exp_inx),'-*b');
hold off
legend('DC & DCA','DC','DCA','Exp DC & DCA','Exp DCA');

subplot(3,2,3);
plot(t,n+np,'k');
hold on
plot(t,n,'m');
plot(t,np,'r');
title('Neutrophil');
exp_inx = find(strcmp(componentNames,'N'));
errorbar(time,values(:,exp_inx),(maxvalues(:,exp_inx)-minvalues(:,exp_inx))/2,'color','b');
exp_inx = find(strcmp(componentNames,'N_infected'));
plot(time,values(:,exp_inx),'-*b');
hold off
legend('N & NP','N','NP','Exp N & NP','Exp NP');

subplot(3,2,4);
plot(t,mono,'k',t,monoblood,'m');
title('Monocytes');
exp_inx = find(strcmp(componentNames,'Mono'));
hold on
plot(time,values(:,exp_inx),'-*b');
%errorbar(time,values(:,exp_inx),(maxvalues(:,exp_inx)-minvalues(:,exp_inx))/2,'color','b');
hold off
legend('Mono','MonoBlood','Exp Mono');

subplot(3,2,5);
plot(t,rhop,'k');
title('rho P');

subplot(3,2,6);
hs = plot(t,ifng,t,il1a);
hold on
exp_inxs = [];
exp_inxs(end+1) = find(strcmp(sharma_componentNames,'IFNG'));
exp_inxs(end+1) = find(strcmp(sharma_componentNames,'IL1A'));
exp_hs = plot(repmat(sharma_time,1,length(exp_inxs)),sharma_values(:,exp_inxs));
set(exp_hs,'marker','*');
hold off
title('Cytokines');
legend([hs;exp_hs],{'IFNG','IL1','Exp IFNG','Exp IL1A'});
