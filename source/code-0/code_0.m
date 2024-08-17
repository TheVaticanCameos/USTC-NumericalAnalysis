tmp1 = 0.0:0.1:1.0;
tmp2 = 10:10:300;
xList = [tmp1, tmp2];
kList = 1:41;
valueList = 1:41;

exactValue = readmatrix("exactValue.txt"); 
for i = 1:length(exactValue)
    [valueList(i), kList(i)] = hamming(xList(i), exactValue(i));
end

for i = 1:length(exactValue)
    fprintf("%.1f  %.6f  %d\n", xList(i), valueList(i), kList(i));
end

for i = 1:length(exactValue)
    fprintf("%.6f\t", valueList(i));
end