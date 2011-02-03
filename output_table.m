function output_table(fid,t,data,name)
figure;
data_itbl = interp1(data(1:(length(data)/2)),data((length(data)/2+1):end),t,'cubic');
plot(t,data_itbl,data(1:(length(data)/2)),data((length(data)/2+1):end));
title(name);
n = 10;
for i = 1:length(t)/n
    if i == length(t)/n
    fprintf(fid,'ELSE\r');
    elseif i == 1
    fprintf(fid,'IF (T .LT. %f) THEN\r',t(n*(i-1)+n+1));
    else
    fprintf(fid,'ELSE IF (T .LT. %f) THEN\r',t(n*(i-1)+n+1));
    end
    fprintf(fid,'TABLE %s_tbl_%d, 1, %d / ',name,i,n);
    str1 = sprintf('%s',mat2str(t(n*(i-1)+(1:n))));
    str1 = str1(2:end-1);
    inxs = find(str1 == ' ');
    str1(inxs) = ',';
    str2 = sprintf('%s',mat2str(data_itbl(n*(i-1)+(1:n))));
    str2 = str2(2:end-1);
    inxs = find(str2 == ' ');
    str2(inxs) = ',';
    fprintf(fid,'%s,%s',str1,str2);
    fprintf(fid,' /\r');
    fprintf(fid,'%s = %s_tbl_%d(T)\r',name,name,i);
    if i == length(t)/n
        fprintf(fid,'END IF\r\r');
    end
end