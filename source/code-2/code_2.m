% code 2
NList = [5, 10, 20, 40];
error1 = zeros(4, 1);
error2 = zeros(4, 1);
for k = 1:length(NList)
    N = NList(k);
    x1 = 1 - (0:N) * 2 / N;
    x2 = -cos((2*(0:N) + 1)*pi/(2*N+2));
    y1 = 1./(1 + 25*x1.^2);
    y2 = 1./(1 + 25*x2.^2);

    yTest = (0:100)/50 - 1;
    p1 = zeros(length(yTest), 1);
    p2 = p1;
    for i = 1:length(yTest)
        p1(i) = interpolate_n(x1, y1, yTest(i));
        p2(i) = interpolate_n(x2, y2, yTest(i));
    end
    error1(k) = max(abs(p1' - (1./(1+25*yTest.^2))));
    error2(k) = max(abs(p2' - (1./(1+25*yTest.^2))));

    if N == 20
        plot(yTest, p1, 'b', 'LineWidth', 1.5);
        hold on;
        plot(yTest, p2, 'g', 'LineWidth', 1.5);
        hold on;
        xx = -1:0.01:1;
        yy = 1./(1+25*xx.^2);
        plot(xx, yy, 'r','LineWidth', 1);
        legend('grid (1)', 'grid (2)', 'original', 'Location', 'south');
        title("Comparison of two interpolation grids");
    end
end

for k = 1:length(NList)
    fprintf("N=%d\n", NList(k));
    fprintf("Max Error of grid (1): %.6f\n", error1(k));
    fprintf("Max Error of grid (2): %.6f\n", error2(k));
end
