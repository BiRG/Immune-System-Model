data = SBmeasurement('Woolard data for sbtoolbox.xls')
[time,componentNames,values,minvalues,maxvalues] = SBmeasurementdata(data);

load('woolard_simulation_results')
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

figure(2);
subplot(3,2,1);
plot(t,m,'k');
title('Machrophage');
exp_inx = find(strcmp(componentNames,'M'));
hold on
errorbar(time,values(:,exp_inx),(maxvalues(:,exp_inx)-minvalues(:,exp_inx))/2,'color','b');
hold off

subplot(3,2,2);
plot(t,dc+dca,'k');
hold on
plot(t,dc,'m');
plot(t,dca,'r');
title('Dendritic Cell');
exp_inx = find(strcmp(componentNames,'DC'));
errorbar(time,values(:,exp_inx),(maxvalues(:,exp_inx)-minvalues(:,exp_inx))/2,'color','b');
% exp_inx = find(strcmp(componentNames,'DC_activated'));
% plot(time,values(:,exp_inx),'-*b');
hold off
legend('DC & DCA','DC','DCA','Exp DC & DCA');

subplot(3,2,3);
plot(t,n+np,'k');
hold on
plot(t,n,'m');
plot(t,np,'r');
title('Neutrophil');
exp_inx = find(strcmp(componentNames,'N'));
errorbar(time,values(:,exp_inx),(maxvalues(:,exp_inx)-minvalues(:,exp_inx))/2,'color','b');
% exp_inx = find(strcmp(componentNames,'N_infected'));
% plot(time,values(:,exp_inx),'-*b');
hold off
legend('N & NP','N','NP','Exp N & NP');

subplot(3,2,4);
plot(t,mono,'k',t,monoblood,'m');
title('Monocytes');
% exp_inx = find(strcmp(componentNames,'Mono'));
% hold on
% plot(time,values(:,exp_inx),'-*b');
% %errorbar(time,values(:,exp_inx),(maxvalues(:,exp_inx)-minvalues(:,exp_inx))/2,'color','b');
% hold off
legend('Mono','MonoBlood');

subplot(3,2,5);
plot(t,rhop,'k');
title('rho P');

subplot(3,2,6);
plot(t,ic,'k',t,aic,'b');
title('Cytokines');
legend('Inflammatory','Anti');
