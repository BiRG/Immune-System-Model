function newD = findBetterD(d,d1,d2)
newD=d1;
[set1 set2]=divide(d,d1,d2);
oldScore=score(d,set1,set2,d1,d2);
for i=1:length(d)
    if (d(i) ~= d1 && d(i) ~= d2)
        [set1 set2]=divide(d,d(i),d2);
        newScore=score(d,set1,set2,d(i),d2);
        if (newScore < oldScore)
            oldScore = newScore;
            newD = d(i);
        end
    end
end