% Some other change
prepare @clear @all

% mouse values
mouse
% U112 values
U112

% put initial cell numbers hall.m, or in mouse m-file?
M0 = 1.75e6
DC0 = 4.5e5 
NK0 = 340
N0 = 6e5
MONO0 = 5e5
%MonoBlood0 = Mono0
%MonoBloodTissue0 = Mono0

SIMULATION = 1; % Hall
TSTOP=72;
start @nocallback
results = [_t _m _dc _nk _mono _monoblood _rhop _n _pn _np _ic _aic _dca _mp _ifng];
save results @file='hall_simulation_results' @format=Matlab
