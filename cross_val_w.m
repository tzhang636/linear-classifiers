function [bs, ba] = cross_val_w(y_tr, x_tr, y_t, x_t)
[fo_t, ex_t, feat_t] = size(x_t);
bs = 0; ba = 0;
s = 0.1; c = 0;

while s <= 2.0
    for i = 1:fo_t
        [w, theta, ~] = learn_w(y_tr(i,:,:).', squeeze(x_tr(i,:,:)), s, ones(feat_t, 1), -10);
        c = c + test(y_t(i,:,:).', squeeze(x_t(i,:,:)), w, theta);
    end
    trials = fo_t*ex_t;
    if c/trials > ba
        bs = s;
        ba = c/trials;
    end
    c = 0;
    s = s+0.1;
end
end