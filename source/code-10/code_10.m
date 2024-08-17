% code 10
f = @(x, y) exp(x*y) + cos(y-x);
a = 1;
b = 2;
y0 = 3;
h = 0.01;
[x, y] = adaptiveRKF(f, a, b, h, y0, 1e-7);

figure(1);
plot(x, y, 'LineWidth', 1.5);
title("RKF54: $ y'(x)=e^{yx} + \cos(y-x), \ y(1)=3 $", 'Interpreter', 'latex');
xlabel("$x$", 'Interpreter', 'latex');
ylabel("$y$", 'Interpreter', 'latex');
fprintf("Please enter a number between 1 and %.5f: ", x(end));
xx = input("");
idx_v = find(x<xx);
idx = idx_v(end);
fprintf("Value at %.5f is: %.5f\n", xx, y(idx) + (xx - x(idx)) * (y(idx+1) - y(idx)) / (x(idx+1) - x(idx)));
