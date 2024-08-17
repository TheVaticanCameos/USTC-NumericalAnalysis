function I = compositeGauss(f, x)
    n = (length(x) - 1) / 2;
    a = x(1);
    b = x(end);
    h = (b - a) / (4 * n);
    I = 0;
    step = sqrt(0.6);
    for k = 1:2*n
        mid = (x(k) + x(k+1)) / 2;
        I = I + 5 * f(mid - h * step) + 5 * f(mid + h * step) + 8 * f(mid);
    end
    I = h * I / 9;
end