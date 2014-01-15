function [w, theta, errors] = learn_w(y, x, alpha, w0, theta)
[ex, feat] = size(x);
w = w0;
errors = zeros(ex, 1);
num_errors = 0;

for i = 1:ex
    y_i = y(i);
    x_i = x(i,:);

    if y_i*(dot(w, x_i)+theta) <= 0
        if y_i == 1
            for j = 1:feat
                if x_i(j) ~= 0
                 w(j) = w(j)*alpha;
                end
            end
        end
        
        if y_i == -1
            for j=1:feat
                if x_i(j) ~= 0
                 w(j) = w(j)/alpha;
                end
            end
        end
        
        num_errors = num_errors + 1;
    end

    errors(i) = num_errors;
end
end