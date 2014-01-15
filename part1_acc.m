function part1_acc()
[y1, x1] = gen(10, 100, 500, 25000);
[y2, x2] = gen(10, 100, 1000, 25000);
[y1_tr, x1_tr, y1_t, x1_t] = cr_folds(y1, x1, 5);
[y2_tr, x2_tr, y2_t, x2_t] = cr_folds(y2, x2, 5);

%[blr_p1, ba_p1] = cross_val_p(y1_tr, x1_tr, y1_t, x1_t);
%[blr_p2, ba_p2] = cross_val_p(y2_tr, x2_tr, y2_t, x2_t);

[bm_pm1, blr_pm1, ba_pm1] = cross_val_pm(y1_tr, x1_tr, y1_t, x1_t);
[bm_pm2, blr_pm2, ba_pm2] = cross_val_pm(y2_tr, x2_tr, y2_t, x2_t);

%[bm_apm1, ba_apm1] = cross_val_apm(y1_tr, x1_tr, y1_t, x1_t);
%[bm_apm2, ba_apm2] = cross_val_apm(y2_tr, x2_tr, y2_t, x2_t);

%[bs_w1, ba_w1] = cross_val_w(y1_tr, x1_tr, y1_t, x1_t);
%[bs_w2, ba_w2] = cross_val_w(y2_tr, x2_tr, y2_t, x2_t);

%blr_p1
%ba_p1
%blr_p2
%ba_p2

bm_pm1
blr_pm1
ba_pm1
bm_pm2
blr_pm2
ba_pm2

%bm_apm1
%ba_apm1
%bm_apm2
%ba_apm2

%bs_w1
%ba_w1
%bs_w2
%ba_w2
end