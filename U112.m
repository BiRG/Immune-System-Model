
% U112 values

% Cytokine
P50_ANTI_INFLAMMATORY = 100
P50_IC_MONO = 20
P50_IC_NK = 20

% Natural killer cell
KRECNK_INFLAMMATORY = 0.03
KDEGNK_ANTI_INFLAMMATORY = 0.04

% Neutrophil
KRECN_INFLAMMATORY = 0.1
P50_IC_N = 160
%constant kdegN_anti_inflammatory = 250
%constant tau_PN_N = 50

% Pathogens engulfed by neutrophils
%constant kdeathPN = 0.001
KLYSN = 0
P50LYS = 10
KREP = 0.693

% Pathogens engulfed by macrophage
KDEATHPM = 0.05
KLYS = 10

% Pathogens engulfed by dendritic cells
KLYSDC = 10

% Monoctyes in blood
KMIGMONOBLOOD_INFLAMMATORY = 0.1      % Increase in influx per MCP-1 or MCP-3

% Macrophage
CHEMOI = 0.5e-8 % 0.25e2                 % chemotactic index (fit, unitless)
KDEGMAX = 0.3

% Dendritic cell
%kmigDCA = 30*kmigDC
P50_RHOP_DC = 2000

