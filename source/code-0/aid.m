% matlab aid
value = 0.0:0.1:1.0;
i = 1;
for x = 0.0:0.1:1.0
    syms k;
    value(i) = symsum(1/(k*(k+x)), k, 1, Inf);
    i = i + 1;
end
for i=1:length(value)
    fprintf("%.7f\n",value(i));
end