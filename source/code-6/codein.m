% codein
%% (1)
f = @(x) 1 ./ (1 + 25*x.^2);
NList = 5. * (1:8);
integral = 1:8;
for i = 1:length(NList)
    N = NList(i);
    x = 1 - (0:N).*2./N;
    integral(i) = integralLagrange(f, x);
end
trueValue = 0.4 * atan(5);
error = abs(integral - trueValue);
for i = 1:length(NList)
    fprintf("%d\t %.6e\t %.6e\t %.6e\n", NList(i), integral(i), trueValue, error(i));
end


%% (2)
f = @(x) 1 ./ (1 + 25*x.^2);
NList = 5. * (1:8);
integral = 1:8;
for i = 1:length(NList)
    N = NList(i);
    x = -cos((0:N) * pi / N);
    integral(i) = integralLagrange(f, x);
end
trueValue = 0.4 * atan(5);
error = abs(integral - trueValue);
for i = 1:length(NList)
    fprintf("%d\t %.6e\t %.6e\t %.6e\n", NList(i), integral(i), trueValue, error(i));
end
