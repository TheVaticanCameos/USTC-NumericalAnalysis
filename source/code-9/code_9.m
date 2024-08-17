% code 9

%% prepare
a = 0;
b = 5;
h = 0.01;

%% (1)
lambda = 5;
f = @(t, x) lambda * x + cos(t) - lambda * sin(t);

x = RK4(f, a, b, h, 0);
t = a:h:b;
real_x = sin(t);
error = abs(x - real_x);
fprintf("k\t t\t\t\t x\t\t e\n");
for i = 1:5
    fprintf("%d\t %.3f\t %.3f %.3e\n", i, t(i), x(i), error(i));
end
fprintf("...\n");
for i = length(x)-4:length(x)
    fprintf("%d\t %.3f\t %.3f %.3e\n", i, t(i), x(i), error(i));
end
figure(1);
plot(t ,error, 'LineWidth', 1.5);
title("Error of x(t) with RK4, \lambda="+num2str(lambda));
xlabel("t");
ylabel("error");

%% (2)
lambda = -5;
f = @(t, x) lambda * x + cos(t) - lambda * sin(t);

x = RK4(f, a, b, h, 0);
t = a:h:b;
real_x = sin(t);
error = abs(x - real_x);
fprintf("k\t t\t\t\t x\t\t e\n");
for i = 1:5
    fprintf("%d\t %.3f\t %.3f %.3e\n", i, t(i), x(i), error(i));
end
fprintf("...\n");
for i = length(x)-4:length(x)
    fprintf("%d\t %.3f\t %.3f %.3e\n", i, t(i), x(i), error(i));
end
figure(2);
plot(t ,error, 'LineWidth', 1.5);
title("Error of x(t) with RK4, \lambda="+num2str(lambda));
xlabel("t");
ylabel("error");

%% (3)
lambda = -10;
f = @(t, x) lambda * x + cos(t) - lambda * sin(t);

x = RK4(f, a, b, h, 0);
t = a:h:b;
real_x = sin(t);
error = abs(x - real_x);
fprintf("k\t t\t\t\t x\t\t e\n");
for i = 1:5
    fprintf("%d\t %.3f\t %.3f %.3e\n", i, t(i), x(i), error(i));
end
fprintf("...\n");
for i = length(x)-4:length(x)
    fprintf("%d\t %.3f\t %.3f %.3e\n", i, t(i), x(i), error(i));
end
figure(3);
plot(t ,error, 'LineWidth', 1.5);
title("Error of x(t) with RK4, \lambda="+num2str(lambda));
xlabel("t");
ylabel("error");