prepare @clear @all

TSTOP=72
start @nocallback
results = [_t _m _dc _nk _mono _monoblood _rhop _n _pn _np _ic _aic]
save results @file='hall_simulation_results' @format=Matlab