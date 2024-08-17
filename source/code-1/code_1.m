% 拉格朗日插值
NList = [5, 10, 20, 40];
error1 = zeros(4, 1);
error2 = zeros(4, 1);
for k = 1:length(NList)
    N = NList(k);
    x1 = 5 - (0:10/N:10);
    y1 = 1 ./ (1+x1.^2);
    x2 = (1/(2*N+2)):(1/(N+1)):((2*N+1)/(2*N+2));
    x2 = -5*cos(pi*x2);
    y2 = 1 ./ (1+x2.^2);

    yTest = (0:0.1:10) - 5;
    p1 = zeros(length(yTest), 1);
    p2 = p1;
    for i = 1:length(yTest)
        p1(i) = interpolate_l(x1, y1, yTest(i));
        p2(i) = interpolate_l(x2, y2, yTest(i));
    end
    error1(k) = max(abs(p1' - (1./(1+yTest.^2))));
    error2(k) = max(abs(p2' - (1./(1+yTest.^2))));

    if N == 10
        plot(yTest, p1, 'b');
        hold on;
        plot(yTest, p2, 'g');
        hold on;
        xx = -5:0.1:5;
        yy = 1./(1+xx.^2);
        plot(xx, yy, 'r');
        legend('grid (1)', 'grid (2)', 'original','Location', 'south');
        title("Comparison of two interpolation grids");
    end
end

for k = 1:length(NList)
    fprintf("N=%d\n", NList(k));
    fprintf("Max Error of grid (1): %.6f\n", error1(k));
    fprintf("Max Error of grid (2): %.6f\n", error2(k));
end

