function y = linearFDM(a, alpha, b, beta, n, u, v, w)
    A = zeros(n, n);
    B = zeros(n, 1);
    h = (b-a)/(n+1);
    a0 = -1 - h * w(a+h) / 2;
    cn = -1 + h * w(a+n*h) / 2;
    for i = 1:n-1
        A(i, i) = 2 + h*h*v(a+i*h);
        A(i, i+1) = -1 + h*w(a+i*h)/2;
        A(i+1, i) = -1 - h*w(a+(i+1)*h)/2;
        B(i) = -h*h*u(a+i*h);
    end
    A(n, n) = 2 + h * h * v(a+n*h);
    B(n) = -h * h * u(a+n*h);
    B(1) = B(1) - a0 * alpha;
    B(n) = B(n) - cn * beta;
    y = A\B;
    y = y';
end