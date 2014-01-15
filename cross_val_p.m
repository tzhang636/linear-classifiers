function [blr, ba] = cross_val_p(y_tr, x_tr, y_t, x_t)
[fo_t, ex_t, feat_t] = size(x_t);
blr = 0; ba = 0;
c = 0; lr = 0.0001;

while lr <= 0.001
    for i = 1:fo_t
        [w, theta, ~] = learn_p(y_tr(i,:,:).', squeeze(x_tr(i,:,:)), lr, ones(feat_t, 1), -10);
        c = c + test(y_t(i,:,:).', squeeze(x_t(i,:,:)), w, theta);
    end
    trials = fo_t*ex_t;
    if c/trials > ba
        blr = lr;
        ba = c/trials;
    end
    c = 0;
    lr = lr+0.0001;
end
end