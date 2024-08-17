function I = compositeSimpson(f, x)
    % composite Simpson integral
    n = length(x) - 1;
    h = (x(end) - x(1)) / n;
    I = f(x(1)) + f(x(end));
    for i = 2:2:n
        I = I + 4 * f(x(i));
    end
    for i = 3:2:n
        I = I + 2 * f(x(i));
    end
    I = I * h / 3;
end