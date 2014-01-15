function [w, theta, errors] = learn_pm(y, x, eta, gamma, w0, theta0)
[ex, ~] = size(x);
w = w0;
theta = theta0;
errors = zeros(ex, 1);
num_errors = 0;

for i = 1:ex
    y_i = y(i);
    x_i = x(i,:);

    c = y_i*(dot(w, x_i)+theta);
    if c < gamma
        w = w+eta*y_i*x_i.';
        theta = theta+eta*y_i;
    end

    if c <= 0
        num_errors = num_errors+1;
    end

    errors(i) = num_errors;
end
end
