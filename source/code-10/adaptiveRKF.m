function [x, y] = adaptiveRKF(f, a, b, h, y0, delta)
    % Adaptive Runge-Kutta-Fehlberg 54 method
    p = 5;
    hmin = 1e-12;
    x = [];
    y = [];
    xCur = a;
    yCur = y0;
    while true
        F1 = h * f(xCur, yCur);
        F2 = h * f(xCur + h/4, yCur + F1/4);
        F3 = h * f(xCur + 3*h/8, yCur + 3*F1/32 + 9*F2/32);
        F4 = h * f(xCur + 12*h/13, yCur + 1932*F1/2197 - 7200*F2/2197 + 7296*F3/2197);
        F5 = h * f(xCur + h, yCur + 439*F1/216 - 8*F2 + 3680*F3/513 - 845*F4/4104);
        F6 = h * f(xCur + h/2, yCur - 8*F1/27 + 2*F2 - 3544*F3/2565 + 1859*F4/4104 - 11*F5/40);
        
        xCur = xCur + h;
        yCur = yCur + 16*F1/135 + 6656*F3/12825 + 28561*F4/56430 - 9*F5/50 + 2*F6/55;
        
        if xCur >= b || isinf(yCur) || isnan(yCur)
            break;
        end
        
        x = [x, xCur];
        y = [y, yCur];
        
        e = F1/360 - 128*F3/4275 - 2197*F4/75240 + F5/50 + 2*F6/55;
        h = max(0.9 * h * (delta / abs(e))^(1/(1+p)), hmin);
    end
end