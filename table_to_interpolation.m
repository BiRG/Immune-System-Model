% Use interpolation to fill in some of the values

% TABLE P_experimental_tbl_hall, 1, 3 / 0,24,72,0,1e6,1e8 / ! Hall
% TABLE P_experimental_tbl_woolard, 1, 6 / 0,24,72,168,240,336,0,2204.365,81366.88,902036.3,1271972,786.1808 /
% TABLE inflammatory_cytokine_tbl_hall, 1, 5 / 0,6,24,72,120,0,32.7,32.6,838.3,171.2 / ! Sharma IFN-gamma
% TABLE inflammatory_cytokine_tbl_woolard, 1, 6 / 0,6,24,72,120,350,0,32.7,32.6,193.6,37.9,37.9 / ! Modified Sharma IFN-gamma
% 
% TABLE MCP1_tbl_hall, 1, 5 / 0,6,24,72,120,49,78,71,17270,28683 / ! Sharma - monocyte recruitment
% TABLE MCP3_tbl_hall, 1, 5 / 0,6,24,72,120,50,83,88,11630,16319 / ! Sharma - monocyte recruitment
% TABLE GROA_tbl_hall, 1, 5 / 0,6,24,72,120,28,60,211,4458.7,5205.4 / ! Sharma - neutrophil recruitment (surrogate for IL-8)
% TABLE IL1B_tbl_hall, 1, 5 / 0,6,24,72,120,952.3,1055,1357,6723.3,4064.7 / ! Sharma - NK recruitment
% TABLE IL18_tbl_hall, 1, 5 / 0,6,24,72,120,767.8,812,946.7,8283.3,14926.7 / ! Sharma - cytokine secreted by infected epithelial cells acting on NK cells (surrogate for IFN-alpha and -beta)
% TABLE IFNG_tbl_hall, 1, 5 / 0,6,24,72,120,7.8375,11.1,12.1,639.8,138.3 / ! Sharma - secreted by NK cells and it is a pro-inflammatory

close all

tstep = 6;

figure;
subplot(3,3,1);
t = 0:tstep:72;
P_experimental_tbl_hall = [0,24,72,0,1e6,1e8];
P_exp_itbl_hall = interp1(P_experimental_tbl_hall(1:3),P_experimental_tbl_hall(4:end),t,'cubic');
plot(t,P_exp_itbl_hall,P_experimental_tbl_hall(1:3),P_experimental_tbl_hall(4:end));
title('P');
str1 = sprintf('%s',mat2str(t));
str1 = str1(2:end-1);
inxs = find(str1 == ' ');
str1(inxs) = ',';
str2 = sprintf('%s',mat2str(P_exp_itbl_hall));
str2 = str2(2:end-1);
inxs = find(str2 == ' ');
str2(inxs) = ',';
fprintf('TABLE P_exp_itbl_hall, 1, %d / %s,%s / ! Hall\n',length(t),str1,str2);

subplot(3,3,2);
t = 0:tstep:120;
MCP1_tbl_hall = [0,6,24,72,120,49,78,71,17270,28683];
MCP1_itbl_hall = interp1(MCP1_tbl_hall(1:5),MCP1_tbl_hall(6:end),t,'cubic');
plot(t,MCP1_itbl_hall,MCP1_tbl_hall(1:5),MCP1_tbl_hall(6:end));
title('MCP1');
str1 = sprintf('%s',mat2str(t));
str1 = str1(2:end-1);
inxs = find(str1 == ' ');
str1(inxs) = ',';
str2 = sprintf('%s',mat2str(MCP1_itbl_hall));
str2 = str2(2:end-1);
inxs = find(str2 == ' ');
str2(inxs) = ',';
fprintf('TABLE MCP1_itbl_hall, 1, %d / %s,%s / ! Hall\n',length(t),str1,str2);

subplot(3,3,3);
t = 0:tstep:120;
MCP3_tbl_hall = [0,6,24,72,120,50,83,88,11630,16319];
MCP3_itbl_hall = interp1(MCP3_tbl_hall(1:5),MCP3_tbl_hall(6:end),t,'cubic');
plot(t,MCP3_itbl_hall,MCP3_tbl_hall(1:5),MCP3_tbl_hall(6:end));
title('MCP3');
str1 = sprintf('%s',mat2str(t));
str1 = str1(2:end-1);
inxs = find(str1 == ' ');
str1(inxs) = ',';
str2 = sprintf('%s',mat2str(MCP3_itbl_hall));
str2 = str2(2:end-1);
inxs = find(str2 == ' ');
str2(inxs) = ',';
fprintf('TABLE MCP3_itbl_hall, 1, %d / %s,%s / ! Hall\n',length(t),str1,str2);

subplot(3,3,4);
t = 0:tstep:120;
GROA_tbl_hall = [0,6,24,72,120,28,60,211,4458.7,5205.4];
GROA_itbl_hall = interp1(GROA_tbl_hall(1:5),GROA_tbl_hall(6:end),t,'cubic');
plot(t,GROA_itbl_hall,GROA_tbl_hall(1:5),GROA_tbl_hall(6:end));
title('GROA');
str1 = sprintf('%s',mat2str(t));
str1 = str1(2:end-1);
inxs = find(str1 == ' ');
str1(inxs) = ',';
str2 = sprintf('%s',mat2str(GROA_itbl_hall));
str2 = str2(2:end-1);
inxs = find(str2 == ' ');
str2(inxs) = ',';
fprintf('TABLE GROA_itbl_hall, 1, %d / %s,%s / ! Hall\n',length(t),str1,str2);

subplot(3,3,5);
t = 0:tstep:120;
IL1B_tbl_hall = [0,6,24,72,120,952.3,1055,1357,6723.3,4064.7];
IL1B_itbl_hall = interp1(IL1B_tbl_hall(1:5),IL1B_tbl_hall(6:end),t,'cubic');
plot(t,IL1B_itbl_hall,IL1B_tbl_hall(1:5),IL1B_tbl_hall(6:end));
title('IL1B');
str1 = sprintf('%s',mat2str(t));
str1 = str1(2:end-1);
inxs = find(str1 == ' ');
str1(inxs) = ',';
str2 = sprintf('%s',mat2str(IL1B_itbl_hall));
str2 = str2(2:end-1);
inxs = find(str2 == ' ');
str2(inxs) = ',';
fprintf('TABLE IL1B_itbl_hall, 1, %d / %s,%s / ! Hall\n',length(t),str1,str2);

subplot(3,3,6);
t = 0:tstep:120;
IL18_tbl_hall = [0,6,24,72,120,767.8,812,946.7,8283.3,14926.7];
IL18_itbl_hall = interp1(IL18_tbl_hall(1:5),IL18_tbl_hall(6:end),t,'cubic');
plot(t,IL18_itbl_hall,IL18_tbl_hall(1:5),IL18_tbl_hall(6:end));
title('IL18');
str1 = sprintf('%s',mat2str(t));
str1 = str1(2:end-1);
inxs = find(str1 == ' ');
str1(inxs) = ',';
str2 = sprintf('%s',mat2str(IL18_itbl_hall));
str2 = str2(2:end-1);
inxs = find(str2 == ' ');
str2(inxs) = ',';
fprintf('TABLE IL18_itbl_hall, 1, %d / %s,%s / ! Hall\n',length(t),str1,str2);

subplot(3,3,7);
t = 0:tstep:120;
IFNG_tbl_hall = [0,6,24,72,120,7.8375,11.1,12.1,639.8,138.3];
IFNG_itbl_hall = interp1(IFNG_tbl_hall(1:5),IFNG_tbl_hall(6:end),t,'cubic');
plot(t,IFNG_itbl_hall,IFNG_tbl_hall(1:5),IFNG_tbl_hall(6:end));
title('IFNG');
str1 = sprintf('%s',mat2str(t));
str1 = str1(2:end-1);
inxs = find(str1 == ' ');
str1(inxs) = ',';
str2 = sprintf('%s',mat2str(IFNG_itbl_hall));
str2 = str2(2:end-1);
inxs = find(str2 == ' ');
str2(inxs) = ',';
fprintf('TABLE IFNG_itbl_hall, 1, %d / %s,%s / ! Hall\n',length(t),str1,str2);

% Now print out format for AcslX
% TABLE P_experimental_tbl_woolard, 1, 6 / 0,24,72,168,240,336,0,2204.365,81366.88,902036.3,1271972,786.1808 /
% TABLE inflammatory_cytokine_tbl_hall, 1, 5 / 0,6,24,72,120,0,32.7,32.6,838.3,171.2 / ! Sharma IFN-gamma
% TABLE inflammatory_cytokine_tbl_woolard, 1, 6 / 0,6,24,72,120,350,0,32.7,32.6,193.6,37.9,37.9 / ! Modified Sharma IFN-gamma
% 
% TABLE MCP1_tbl_hall, 1, 5 / 0,6,24,72,120,49,78,71,17270,28683 / ! Sharma - monocyte recruitment
% TABLE MCP3_tbl_hall, 1, 5 / 0,6,24,72,120,50,83,88,11630,16319 / ! Sharma - monocyte recruitment
% TABLE GROA_tbl_hall, 1, 5 / 0,6,24,72,120,28,60,211,4458.7,5205.4 / ! Sharma - neutrophil recruitment (surrogate for IL-8)
% TABLE IL1B_tbl_hall, 1, 5 / 0,6,24,72,120,952.3,1055,1357,6723.3,4064.7 / ! Sharma - NK recruitment
% TABLE IL18_tbl_hall, 1, 5 / 0,6,24,72,120,767.8,812,946.7,8283.3,14926.7 / ! Sharma - cytokine secreted by infected epithelial cells acting on NK cells (surrogate for IFN-alpha and -beta)
% TABLE IFNG_tbl_hall, 1, 5 / 0,6,24,72,120,7.8375,11.1,12.1,639.8,138.3 / ! Sharma - secreted by NK cells and it is a pro-inflammatory



