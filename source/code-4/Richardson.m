function D = Richardson(f, x, m)
    % Richardson extrapolation
    h = 1;
    D = zeros(m+1, m+1);

    for i = 1:m+1
        D(i, 1) = phi(h/(2^(i-1)));
    end

    for k = 2:m+1
        for n = k:m+1
            D(n, k) = 4^(k-1) * D(n, k-1) / (4^(k-1) - 1) - D(n-1, k-1) / (4^(k-1) - 1);
        end
    end
    
    function y = phi(z)
        y = (f(x+z) - f(x-z)) / (2*z);
    end
end