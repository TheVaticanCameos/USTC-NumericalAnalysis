% code_5
%% (1)
f = @sin;
kList = 1:12;
trapezoidal = 1:12;
simpson = 1:12;
for i = 1:length(kList)
    k = kList(i);
    N = 2^k;
    x = (0:N) ./ N .* 4;
    trapezoidal(i) = compositeTrapezoidal(f, x);
    simpson(i) = compositeSimpson(f, x);
end
trueValue = 1 - cos(4);
errorTrapezoidal = abs(trapezoidal - trueValue);
errorSimpson = abs(simpson - trueValue);
orderTrapezoidal = 1:12;
orderSimpson = 1:12;
for i = 2:12
    orderTrapezoidal(i) = log(errorTrapezoidal(i-1) / errorTrapezoidal(i)) / log(2);
    orderSimpson(i) = log(errorSimpson(i-1) / errorSimpson(i)) / log(2);
end

fprintf("\t\t Composite Simpson error \t order\t\t Composite Trapezoidal error\t order\n");
fprintf("N=2 \t\t %.6e\t\t\t\t\t\t\t %.6e\t \n", errorSimpson(1), errorTrapezoidal(1));
for i = 2:12
    k = kList(i);
    N = 2^k;
    fprintf("N=%d \t\t %.6e \t\t\t %.4e\t\t %.6e\t\t\t\t %.4e\n", ...
        N, errorSimpson(i), orderSimpson(i), errorTrapezoidal(i), orderTrapezoidal(i));
end


%% (2)
f = @sin;
kList = 1:12;
trapezoidal = 1:12;
simpson = 1:12;
for i = 1:length(kList)
    k = kList(i);
    N = 2^k;
    x = (0:N) ./ N .* 2 .* pi;
    trapezoidal(i) = compositeTrapezoidal(f, x);
    simpson(i) = compositeSimpson(f, x);
end
trueValue = 0;
errorTrapezoidal = abs(trapezoidal - trueValue);
errorSimpson = abs(simpson - trueValue);
orderTrapezoidal = 1:12;
orderSimpson = 1:12;
for i = 2:12
    orderTrapezoidal(i) = log(errorTrapezoidal(i-1) / errorTrapezoidal(i)) / log(2);
    orderSimpson(i) = log(errorSimpson(i-1) / errorSimpson(i)) / log(2);
end

fprintf("\t\t Composite Simpson error \t order\t\t Composite Trapezoidal error\t order\n");
fprintf("N=2 \t\t %.6e\t\t\t\t\t\t\t %.6e\t \n", errorSimpson(1), errorTrapezoidal(1));
for i = 2:12
    k = kList(i);
    N = 2^k;
    fprintf("N=%d \t\t %.6e \t\t\t %.4e\t\t %.6e\t\t\t\t %.4e\n", ...
        N, errorSimpson(i), orderSimpson(i), errorTrapezoidal(i), orderTrapezoidal(i));
end