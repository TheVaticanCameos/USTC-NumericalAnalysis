function s = splineOrder3(x, xx, yy, mm)
    % spline of order 3
    n = length(xx) - 1;
    i = floor(x*n) + 1;
    h = xx(i+1) - xx(i);
    s = mm(i) * (xx(i+1) - x)^3 / (6*h) + mm(i+1) * (x - xx(i))^3 / (6*h) ... 
    + (yy(i+1)/h - mm(i+1)*h/6) * (x - xx(i)) + (yy(i)/h - mm(i)*h/6) * (xx(i+1) - x);
end