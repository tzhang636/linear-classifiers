function part2()
load('./data/noisy_data.mat');
%[y_tr, x_tr, y_t, x_t] = cr_folds(y_train, x_train, 5);
%[bm, blr, ba] = cross_val_pm(y_tr, x_tr, y_t, x_t);
%bm
%blr
%ba

[~, feat] = size(x_train);
[w, theta, ~] = learn_pm(y_train, x_train, 0.0001, 0.5, ones(feat, 1), -10);
get_predictions(w, theta, x_test, 'zhang156');

end