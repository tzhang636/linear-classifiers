function c = test(y, x, w, theta)
[ex, ~] = size(x);
c = 0;
for i = 1:ex
    y_i = y(i);
    x_i = x(i,:);
    if y_i*(dot(w,x_i)+theta) > 0
        c = c+1;
    end
end
end