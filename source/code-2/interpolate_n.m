function y = interpolate_n(xx, yy, x)
    % Newton interpolate, return the interpolated value at point x
    n = length(xx);
    for i = 2:n
        for j = n:-1:i
            yy(j) = (yy(j) - yy(j-1)) / (xx(j) - xx(j-i+1));
        end
    end
    y = yy(end);
    for i = n:-1:2
        y = yy(i-1) + (x - xx(i-1))*y;
    end
end