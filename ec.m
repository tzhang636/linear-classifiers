function ec()
%[y, x] = gen_unbal(10, 100, 1000, 30000, 0.25);
%[y_tr, x_tr, y_t, x_t] = cr_folds(y, x, 3);
%[bs, ba] = cross_val_w(y_tr, x_tr, y_t, x_t);
%bs
%ba

[y_tr, x_tr] = gen_unbal(10, 100, 1000, 20000, 0.25);
[y_t, x_t] = gen_unbal(10, 100, 1000, 10000, 0.25);
[bs, ba] = eval_w_ec(y_tr, x_tr, y_t, x_t);
bs
ba
end