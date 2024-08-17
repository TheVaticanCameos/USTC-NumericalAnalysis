function [value, k] = hamming(x, exactValue)
    % compute Hamming function, return value and min k
    value = 0;
    k = 1;
    while abs(value-exactValue) >= 1e-6
        value = value + 1/(k*(k+x));
        k = k + 1;
        if k > 1e7
            break;
        end
    end
end