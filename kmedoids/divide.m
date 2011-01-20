function [set1 set2]=divide(d,d1,d2)
sc1=abs(d-d1);
sc2=abs(d-d2);
set1=[];
set2=[];
for i=1:length(d)
    if (sc1(i) < sc2(i))
        set1(length(set1)+1)=i;%d(i);
    else
        set2(length(set2)+1)=i;%d(i);
    end
end