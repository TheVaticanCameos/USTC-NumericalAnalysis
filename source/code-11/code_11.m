% code 11
f = @(t, x) (t - exp(-t)) ./ (x + exp(x));
x_init = 0;
a = 0;
b = 1;
errorList = 3:8;
for k = 3:8
    N = 2^k;
    h = (b-a) / N;
    x = AdamsBashforth(f, a, b, h, x_init);
    xTrue = -(a:h:b);
    errorList(k-2) = max(abs(x-xTrue));
    if k == 8
        figure(1);
        plot(a:h:b, x, 'LineWidth', 1.5);
        title("Adams-Bashforth method: $x'=\frac{t-e^{-t}}{x+e^x}$", 'Interpreter', 'latex');
        xlabel("$t$", 'Interpreter', 'latex');
        ylabel("$x$", 'Interpreter', 'latex');
    end
end
orderList = 4:8;
for i = 1:length(orderList)
    orderList(i) = log(errorList(i)/errorList(i+1)) / log(2);
end
