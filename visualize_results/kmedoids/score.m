function sc=score(d,set1,set2,d1,d2)
s1=sum(abs(d(set1)-d1));
s2=sum(abs(d(set2)-d2));
sc=s1+s2;