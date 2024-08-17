% code_3
NList = [5 10 20 40];
error1 = 1:length(NList);
error2 = 1:length(NList);
order1 = 1:length(NList);
order2 = 1:length(NList);
for i = 1:length(NList)
    N = NList(i);
    xx = (0:N) / N;
    yy = exp(xx);

    xTest = xx(2:end) - 0.5/N;
    yTest = exp(xTest);
    
    ss = 1:length(xTest);
    for j = 1:length(xTest)
        ss(j) = splineOrder1(xTest(j), xx, yy);
    end
    error1(i) = max(abs(yTest - ss));
    
    mm = get2diff(xx, yy, 1, exp(1));
    for j = 1:length(xTest)
        ss(j) = splineOrder3(xTest(j), xx, yy, mm);
    end
    error2(i) = max(abs(yTest - ss));
end

for i = 2:length(NList)
    order1(i) = log(error1(i-1)/error1(i)) / log(NList(i)/NList(i-1));
    order2(i) = log(error2(i-1)/error2(i)) / log(NList(i)/NList(i-1));
end

fprintf("N = %d\n", NList(1));
fprintf("Max error of method (1) is %.9f\n", error1(1));
fprintf("Max error of method (2) is %.9f\n", error2(1));
fprintf("Order of method (1) is ---\n");
fprintf("Order of method (2) is ---\n");
for i = 2:length(NList)
    fprintf("N = %d\n", NList(i));
    fprintf("Max error of method (1) is %.9f\n", error1(i));
    fprintf("Max error of method (2) is %.9f\n", error2(i));
    fprintf("Order of method (1) is %.9f\n", order1(i));
    fprintf("Order of method (2) is %.9f\n", order2(i));
end
