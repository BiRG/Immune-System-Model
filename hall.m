prepare @clear @all

% I'll update these later... pea

% mouse values
%mouse
% U112 values
%U112

SIMULATION = 1; % Hall
TSTOP=72;
start @nocallback
results = [_t _m _dc _nk _mono _monoblood _rhop _n _pn _np _ic _aic _dca _mp _rmigmonoblood _rphmono _mcp3 _p_experimental _monop _pmono _atii _patii _atiip _mcp3_tmp _rinfatii _ifng _groa _groa_tmp _il18_tmp];
save results @file='hall_simulation_results' @format=Matlab
