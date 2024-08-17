function I = compositeTrapezoidal(f, x)
    % composite trapezoidal integral
    a = x(1);
    b = x(end);
    g = @(x) f((b-a)*x + a);
    
    y = (x-a) ./ (b-a);
    n = length(y) - 1;
    h = (y(end) - y(1)) / n;
    I = g(y(1)) + g(y(end));
    for i = 1:n-1
        I = I + 2*g(y(i+1));
    end
    I = (b-a) * I * h/2;
end