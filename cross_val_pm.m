function [bm, blr, ba] = cross_val_pm(y_tr, x_tr, y_t, x_t)
[fo_t, ex_t, feat_t] = size(x_t);
bm = 0; blr = 0; ba = 0;
m = 0.1; lr = 0.0001; c = 0;

while m <= 2.0
    while lr <= 1.0
        for i = 1:fo_t
            [w, theta, ~] = learn_pm(y_tr(i,:,:).', squeeze(x_tr(i,:,:)), lr, m, ones(feat_t, 1), -10);
            c = c + test(y_t(i,:,:).', squeeze(x_t(i,:,:)), w, theta);
        end
        trials = fo_t*ex_t;
        if c/trials > ba
            bm = m;
            blr = lr;
            ba = c/trials;
        end
        c = 0;
        lr = lr*10;
    end
    lr = 0.0001;
    m = m+0.2;
end
end