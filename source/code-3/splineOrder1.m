function s = splineOrder1(x, xx, yy)
    % spline of order 1
    n = length(xx) - 1;
    idx = floor(x * n) + 1;
    s = (yy(idx+1) - yy(idx)) * (x - xx(idx)) / (xx(idx+1) - xx(idx)) + yy(idx);
end