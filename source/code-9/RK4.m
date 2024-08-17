function x = RK4(f, a, b, h, x0)
    x = a:h:b;
    n = length(x);
    x(1) = x0;
    for i = 1:n-1
        t = a + (i-1)*h;
        F1 = h * f(t, x(i));
        F2 = h * f(t + 0.5*h, x(i) + 0.5*F1);
        F3 = h * f(t + 0.5*h, x(i) + 0.5*F2);
        F4 = h * f(t + h, x(i) + F3);
        x(i+1) = x(i) + (F1 + 2 * F2 + 2* F3 + F4) / 6;
    end
end