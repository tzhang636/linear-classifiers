function [bs, ba] = eval_w_ec(y_tr, x_tr, y_t, x_t)
[ex_t, feat_t] = size(x_t);
bs = 0; ba = 0;
s = 0.1;

while s <= 2.0
    [w, theta, ~] = learn_w(y_tr.', x_tr, s, ones(feat_t, 1), -10);
    c = test(y_t.', x_t, w, theta);

    if c/ex_t > ba
        bs = s;
        ba = c/ex_t;
    end
    
    s = s+0.1;
end
end