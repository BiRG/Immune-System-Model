function dt = create_structure(data)
[time,componentNames,values,minvalues,maxvalues] = SBmeasurementdata(data);
dt = {};
dt.time = time;
dt.componentNames = componentNames;
dt.values = values;
dt.minvalues = minvalues;
dt.maxvalues = maxvalues;
end