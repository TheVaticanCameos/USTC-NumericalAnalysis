%% Richardson extrapolation for ln x, x=3, m=3
x = 3;
m = 3;
f = @log;
D = Richardson(f, x, m);
for i = 1:m+1
    for j = 1:i
        fprintf("%.7f\t", D(i, j));
    end
    fprintf("\n");
end

%% Richardson extrapolation for tan x, x=sin^{-1}(0.8), m=4
x = asin(0.8);
m = 4;
f = @tan;
D = Richardson(f, x, m);
for i = 1:m+1
    for j = 1:i
        fprintf("%.7f\t", D(i, j));
    end
    fprintf("\n");
end

%% Richardson extrapolation for sin(x^2+x/3), x=0, m=5
x = 0;
m = 5;
f = @(x) sin(x^2 + x/3);
D = Richardson(f, x, m);
for i = 1:m+1
    for j = 1:i
        fprintf("%.7f\t", D(i, j));
    end
    fprintf("\n");
end