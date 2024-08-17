function mm = get2diff(xx, yy, m0, mn)
    % compute S'' for spline of order 3
    n = length(xx) - 1;
    h = 1:n;
    for i = 1:n
        h(i) = xx(i+1) - xx(i);
    end
    A = zeros(n+1, n+1);
    A(1,1) = 2*h(1);
    A(1,2) = h(1);
    A(2,1) = h(1);
    for i = 2:n
        A(i,i) = 2*(h(i-1) + h(i));
        A(i,i+1) = h(i);
        A(i+1,i) = h(i);
    end
    A(n+1,n+1) = 2*h(n);
    v = (1:n+1)';
    v(1) = (yy(2) - yy(1))/h(1) - m0;
    for i = 2:n
        v(i) = (yy(i+1) - yy(i))/h(i) - (yy(i) - yy(i-1))/h(i-1);
    end
    v(n+1) = mn - (yy(n+1) - yy(n))/h(n);
    v = 6.*v;
    mm = A\v;
end