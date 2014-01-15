function [bm, ba] = cross_val_apm(y_tr, x_tr, y_t, x_t)
[fo_t, ex_t, feat_t] = size(x_t);
bm = 0; ba = 0;
m = 0; c = 0;

while m <= 2.0
    for i = 1:fo_t
        [w, theta, ~] = learn_apm(y_tr(i,:,:).', squeeze(x_tr(i,:,:)), m, ones(feat_t, 1), -10);
        c = c + test(y_t(i,:,:).', squeeze(x_t(i,:,:)), w, theta);
    end
    trials = fo_t*ex_t;
    if c/trials > ba
        bm = m;
        ba = c/trials;
    end
    c = 0;
    m = m+0.1;
end
end