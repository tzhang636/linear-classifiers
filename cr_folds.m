function [y_tr, x_tr, y_t, x_t] = cr_folds(y, x, num_folds)
y_tr = cr_tr_folds(y, num_folds);
x_tr = cr_tr_folds(x, num_folds);
y_t = cr_t_folds(y, num_folds);
x_t = cr_t_folds(x, num_folds);
end

function ps = cr_tr_folds(x, num_folds)
[ex, feat] = size(x);
ps = zeros(num_folds, ex-ex/num_folds, feat);

for i = 1:num_folds
    ps(i,:,:) = cr_tr_fold(x, num_folds, i);
end
end

function p = cr_tr_fold(x, num_folds, out)
[ex, feat] = size(x);
p = zeros(ex-ex/num_folds, feat);
s = (out-1)*(ex/num_folds)+1;
e = out*(ex/num_folds);

j = 1;
for i = 1:ex
    if i < s || i > e
        p(j,:) = x(i,:);
        j = j+1;
    end
end
end

function ps = cr_t_folds(x, num_folds)
[ex, feat] = size(x);
ps = zeros(num_folds, ex/num_folds, feat);

for i = 1:num_folds
    s = (i-1)*(ex/num_folds)+1;
    e = i*(ex/num_folds);
    ps(i,:,:) = x(s:e,:);
end
end