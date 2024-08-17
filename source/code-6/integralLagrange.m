function I = integralLagrange(f, x)
    % Lagrange Interpolation for numerical integral
    n = length(x) - 1;
    A = zeros(n+1, n+1);
    b = zeros(n+1, 1);
    for k = 1:n+1
        for j = 1:n+1
            A(k, j) = x(j)^(k-1);
        end
        b(k) = (x(end)^k - x(1)^k) / k;
    end
    coef = A\b;
    I = f(x) * coef;
end