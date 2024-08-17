% code 8
f1 = @(x) func1(x);
f2 = @(x) func2(x);
f3 = @(x) func3(x);

R1 = Romberg(f1, 0, 1, 7);
R2 = Romberg(f2, -1, 1, 7);
R3 = Romberg(f3, 0, 1, 7);

fprintf("I1:\n");
for i = 1:7
    for j = 1:i
        fprintf("%.7f\t", R1(i, j));
    end
    fprintf("\n");
end

fprintf("I2:\n");
for i = 1:7
    for j = 1:i
        fprintf("%.7f\t", R2(i, j));
    end
    fprintf("\n");
end

fprintf("I3:\n");
for i = 1:7
    for j = 1:i
        fprintf("%.7f\t", R3(i, j));
    end
    fprintf("\n");
end



function y = func1(x)
    if x == 0
        y = 1;
    else
        y = sin(x) / x;
    end
end

function y = func2(x)
    if x == 0
        y = -1;
    else
        y = (cos(x) - exp(x)) / sin(x);
    end
end

function y = func3(x)
    if x == 0
        y = 0;
    else
        y = 1.0 / (x * exp(1.0/x));
    end
end