prepare @clear @all

SIMULATION = 2; % Woolard
TSTOP=336;
% From Hall (data not directly available from Woolard)
MONO0 = 5e5;
% From Woolard
M0 = 11013;
DC0 = 764;
N0 = 152;
NK0 = 340;
start @nocallback
results = [_t _m _dc _nk _mono _monoblood _rhop _n _pn _np _ic _aic _dca];
save results @file='woolard_simulation_results' @format=Matlab