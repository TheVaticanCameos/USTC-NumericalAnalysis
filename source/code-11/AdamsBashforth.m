function x = AdamsBashforth(f, a, b, h, x_init)
    % Adams Bashforth method (order of 5)
    x = a:h:b;
    t = a;
    
    x4 = x_init;
    x(1) = x4;
    
    F1 = h * f(t, x4);
    F2 = h * f(t + h/2, x4 + F1/2);
    F3 = h * f(t + h/2, x4 + F2/2);
    F4 = h * f(t + h, x4 + F3);
    x3 = x4 + (F1 + 2*F2 + 2*F3 + F4)/6;
    x(2) = x3;
    t = t + h;

    F1 = h * f(t, x3);
    F2 = h * f(t + h/2, x3 + F1/2);
    F3 = h * f(t + h/2, x3 + F2/2);
    F4 = h * f(t + h, x3 + F3);
    x2 = x3 + (F1 + 2*F2 + 2*F3 + F4)/6;
    x(3) = x2;
    t = t + h;

    F1 = h * f(t, x2);
    F2 = h * f(t + h/2, x2 + F1/2);
    F3 = h * f(t + h/2, x2 + F2/2);
    F4 = h * f(t + h, x2 + F3);
    x1 = x2 + (F1 + 2*F2 + 2*F3 + F4)/6;
    x(4) = x1;
    t = t + h;

    F1 = h * f(t, x1);
    F2 = h * f(t + h/2, x1 + F1/2);
    F3 = h * f(t + h/2, x1 + F2/2);
    F4 = h * f(t + h, x1 + F3);
    x0 = x1 + (F1 + 2*F2 + 2*F3 + F4)/6;
    x(5) = x0;

    for i = 6:length(x)
        f0 = f(a+(i-2)*h, x0);
        f1 = f(a+(i-3)*h, x1);
        f2 = f(a+(i-4)*h, x2);
        f3 = f(a+(i-5)*h, x3);
        f4 = f(a+(i-6)*h, x4);
        x(i) = x(i-1) + h*(1901*f0 - 2774*f1 + 2616*f2 - 1274*f3 + 251*f4)/720;
        
        x0 = x(i);
        x1 = x(i-1);
        x2 = x(i-2);
        x3 = x(i-3);
        x4 = x(i-4);
    end
    
end