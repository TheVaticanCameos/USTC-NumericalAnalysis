% code 7
%% (1)
f = @(x) exp(-x.^2);
gauss = 1:7;
trapz = 1:7;
errorGauss = 1:7;
errorTrapz = 1:7;
I = integral(f, 0, 1);
for k = 1:7
    N = 2^k;
    x = (0:N) / N;
    gauss(k) = compositeGauss(f, x);
    trapz(k) = compositeTrapezoidal(f, x);
    errorGauss(k) = abs(gauss(k) - I);
    errorTrapz(k) = abs(trapz(k) - I);
end

orderGauss = 1:7;
orderTrapz = 1:7;
for k = 2:7
    orderGauss(k) = log(errorGauss(k-1) / errorGauss(k)) / log(2);
    orderTrapz(k) = log(errorTrapz(k-1) / errorTrapz(k)) / log(2);
end

fprintf("I1:\n");

fprintf("Trapz\n");
fprintf("%.5e\n", errorTrapz(1));
for k = 2:7
    fprintf("%.5e,\t%.5f\n", errorTrapz(k), orderTrapz(k));
end

fprintf("Gauss\n");
fprintf("%.5e\n", errorGauss(1));
for k = 2:7
    fprintf("%.5e,\t%.5f\n", errorGauss(k), orderGauss(k));
end

fprintf("\n");

%% (2)
f = @(x) 1.0 ./ exp(1 + x.^2);
gauss = 1:7;
trapz = 1:7;
errorGauss = 1:7;
errorTrapz = 1:7;
I = integral(f, 0, 4);
for k = 1:7
    N = 2^k;
    x = 4 * (0:N) / N;
    gauss(k) = compositeGauss(f, x);
    trapz(k) = compositeTrapezoidal(f, x);
    errorGauss(k) = abs(gauss(k) - I);
    errorTrapz(k) = abs(trapz(k) - I);
end

orderGauss = 1:7;
orderTrapz = 1:7;
for k = 2:7
    orderGauss(k) = log(errorGauss(k-1) / errorGauss(k)) / log(2);
    orderTrapz(k) = log(errorTrapz(k-1) / errorTrapz(k)) / log(2);
end

fprintf("I2:\n");

fprintf("Trapz\n");
fprintf("%.5e\n", errorTrapz(1));
for k = 2:7
    fprintf("%.5e,\t%.5f\n", errorTrapz(k), orderTrapz(k));
end

fprintf("Gauss\n");
fprintf("%.5e\n", errorGauss(1));
for k = 2:7
    fprintf("%.5e,\t%.5f\n", errorGauss(k), orderGauss(k));
end

fprintf("\n");

%% (3)
f = @(x) 1.0 ./ (2 + cos(x));
gauss = 1:7;
trapz = 1:7;
errorGauss = 1:7;
errorTrapz = 1:7;
I = integral(f, 0, 2*pi);
for k = 1:7
    N = 2^k;
    x = 2 * pi * (0:N) / N;
    gauss(k) = compositeGauss(f, x);
    trapz(k) = compositeTrapezoidal(f, x);
    errorGauss(k) = abs(gauss(k) - I);
    errorTrapz(k) = abs(trapz(k) - I);
end

orderGauss = 1:7;
orderTrapz = 1:7;
for k = 2:7
    orderGauss(k) = log(errorGauss(k-1) / errorGauss(k)) / log(2);
    orderTrapz(k) = log(errorTrapz(k-1) / errorTrapz(k)) / log(2);
end

fprintf("I3:\n");

fprintf("Trapz\n");
fprintf("%.5e\n", errorTrapz(1));
for k = 2:7
    fprintf("%.5e,\t%.5f\n", errorTrapz(k), orderTrapz(k));
end

fprintf("Gauss\n");
fprintf("%.5e\n", errorGauss(1));
for k = 2:7
    fprintf("%.5e,\t%.5f\n", errorGauss(k), orderGauss(k));
end

fprintf("\n");
