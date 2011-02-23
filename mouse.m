% Intial conditions
M0 = 954907 + 763323.9498
DC0 = 1.41E+05 + 227996.8762
NK0 = 340
N0 = 6.26E+05
MONO0 = 5.90E+05
ATII0 = 2.81E+06
%MONOBLOOD0 = MONO0
%MONOBLOODTISSUE0 = MONO0

LUSA = 500 % cm^2 for mouse (RDDR, EPA)

KRECNK = 0.005        % basal recruitment, replication/cell division 
KDEGNK = 0.005
KRECN = 0.02              % basal recruitment, replication/cell division 
KDEGN = 0.02
KAREAN = 2e-13            % cm*cm/hr
% Monocytes in tissue
% check Goto 2003, Tacke and Randolf 2006 for Mn turnover info - ceh
KDEGMONO = 0               % Based on half-life
%kdiffMonoM = 0.02                   % 1/time for a monoctye to differentiate into macrophage (t Mono/M)
%kdiffMonoDC = 0.02                  % 1/time for a monoctye to differentiate into dendritic cell (t Mono/DC)
% Monoctyes in blood
%krecMonoBlood = 0.04                  % 1/time for a monocyte to migrate
KDEGMONOBLOOD = 0
%kmigMonoBlood = krecMonoBlood
% Macrophage
KDEGM = 0
%kmigM = kdiffMonoM*Mono0/M0     				% Must be balanced in steady state
MVEL = 0.02                     % cm/hr (Stober et al., 1989)
MDIAM = 15.0e-4                 % mac diameter (cm)
% Dendritic cell
%kdegDC = 0.9*kdiffMonoDC*Mono0/DC0 		% must be in steady state
KAREADC = 4.2e-5
%kmigDC = 0.1*kdiffMonoDC*Mono0/DC0     % Must be balanced in steady state
