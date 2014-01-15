function [w, theta, errors] = learn_p(y, x, eta, w0, theta0)
[ex, ~] = size(x);
w = w0;
theta = theta0;
errors = zeros(ex, 1);
num_errors = 0;

for i = 1:ex
    y_i = y(i);
    x_i = x(i,:);

    if y_i*(dot(w, x_i)+theta) <= 0
        w = w+eta*y_i*x_i.';
        theta = theta+eta*y_i;
        num_errors = num_errors+1;
    end

    errors(i) = num_errors;
end
end