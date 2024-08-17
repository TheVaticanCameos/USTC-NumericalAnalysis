function y = interpolate_l(xx, yy, x)
    % Lagrange插值，返回x处的插值函数值
    n = length(xx);
    l = ones(n, 1);
    for i = 1:n
        for j = 1:n
            if j ~= i
                l(i) = l(i) * (x-xx(j)) / (xx(i)-xx(j));
            end
        end
    end
    y = dot(yy, l);
end