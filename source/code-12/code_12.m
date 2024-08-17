% code 12
%% test 1
a = 0;
alpha = 3;
b = pi/2;
beta = 7;
u = @(t) 0;
v = @(t) -1;
w = @(t) 0;
x = @(t) 3*cos(t) + 7*sin(t);
nList = [10 20 40 80 160];
errorList = nList;
for i = 1:length(nList)
    n = nList(i);
    h = (b-a)/(n+1);
    xTest = linearFDM(a, alpha, b, beta, n, u, v, w);
    tTest = a+h:h:b-h;
    xTrue = x(tTest);
    errorList(i) = max(abs(xTest-xTrue));
end

orderList = 2:length(nList);
for i = 2:length(nList)
    orderList(i-1) = log(errorList(i-1)/errorList(i)) / log(2);
end

%% test 2
a = 0;
alpha = 2;
b = 1;
beta = exp(1) + cos(1);
u = @(t) 2*exp(t);
v = @(t) -1;
w = @(t) 0;
x = @(t) cos(t) + exp(t);

nList = [10 20 40 80 160];
errorList = nList;
for i = 1:length(nList)
    n = nList(i);
    h = (b-a)/(n+1);
    xTest = linearFDM(a, alpha, b, beta, n, u, v, w);
    tTest = a+h:h:b-h;
    xTrue = x(tTest);
    errorList(i) = max(abs(xTest-xTrue));
end

orderList = 2:length(nList);
for i = 2:length(nList)
    orderList(i-1) = log(errorList(i-1)/errorList(i)) / log(2);
end