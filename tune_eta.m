%%
% This script produces a sample mistake plot for the Perceptron algorithm,
% using three different values for the learning rate, eta. 
%
% It generates a random l-of-m-of-n data set, and trains the Perceptron 
% algorithm by iterating through the data set once. For each of the
% specified learning rates eta, it obtains the learned weight vector (w) 
% and bias term (theta), as well as a vector containing the cumulative 
% mistake count. It plots these mistake counts on a single graph, allowing us to
% compare the convergence under the different learning rates.
%
% You must implement the basic Perceptron algorithm in perceptron.m before 
% this script will produce meaningful output.
%%
function  tune_eta()
% Set data set parameters; you may re-write this function to take these
% parameters as input arguments.
l = 10
m = 100
n = 500
k = 20000

% Set values of eta to be tested; you may also pass in these argument as a
% vector, if you choose to edit this function.
etas = [2, .2, .02];

% Generate data
[y,x] = gen(l, m, n, k);

% Store errors
errors = zeros(length(etas), k);

for i=1:length(etas)
    % Learn Perceptron, with hard-coded w_0 = 1^n and theta_0 = 0
    [w, theta, cur_errors] = learn_perceptron(y, x, etas(i), ones(n,1), 0);
    errors(i, :) = cur_errors;
end

% Plot results
names = {};
for i=1:length(etas)
    names{1, i} = strcat('eta = ', num2str(etas(i)));
end
plot_figure(1, 'Tuning Perceptron Learning Rate -- Mistakes', 'Number of Examples Seen', 'Number of Mistakes', names, errors);

end

% perceptron
bestLearnRate = 0;
bestN = 0;
bestAcc = 0;
pc = 0;
learnRate = 0.0001;
n = 0;
while learnRate <= 0.001
    for i = 1:5
        [w_percep, theta_percep, err_percep] = learn_perceptron(y1_tr(i,:,:).', squeeze(x1_tr(i,:,:)), learnRate, ones(n1, 1), -10);
        pc = pc + test(y1_t(i,:,:).', squeeze(x1_t(i,:,:)), w_percep, theta_percep);
    end
    if pc/25000 > bestAcc
        bestLearnRate = learnRate;
        bestN = n;
        bestAcc = pc/25000;
    end
    pc = 0;
    learnRate = learnRate + 0.0001;
    n = n - 1;
end
accs(1,1) = bestLearnRate;
accs(1,2) = bestN;
accs(1,3) = bestAcc;

    % perceptron with margin
    bestMargin = 0;
    bestLearnRate = 0;
    bestAcc = 0;
    pmc = 0;
    learnRate = 0.0001;
    margin = 0;
    while margin <= 2.0
        while learnRate <= 1.5
            for i = 1:5
                [w_percep_mg, theta_percep_mg, err_percep_mg] = learn_perceptron_with_margin(y1_tr(i,:,:).', squeeze(x1_tr(i,:,:)), learnRate, margin, ones(n1,1), 0);
                pmc = pmc + test(y1_t(i,:,:).', squeeze(x1_t(i,:,:)), w_percep_mg, theta_percep_mg);
            end
            if pmc/25000 > bestAcc
                bestMargin = margin;
                bestLearnRate = learnRate;
                bestAcc = pmc/25000;
            end
            pmc = 0;
            learnRate = learnRate * 10;
        end
        margin = margin + 0.1;
    end
    accs(2,1) = bestLearnRate;
    accs(2,2) = bestMargin;
    accs(2,3) = bestAcc;
    
    % aggressive perceptron with margin
    bestMargin = 0;
    bestAcc = 0;
    pac = 0;
    margin = 0;
    while margin <= 2.0
        for i = 1:5
            [w_percep_agg, theta_percep_agg, err_percep_agg] = learn_aggressive_perceptron_with_margin(y1_tr(i,:,:).', squeeze(x1_tr(i,:,:)), margin, ones(n1,1), 0);
            pac = pac + test(y1_t(i,:,:).', squeeze(x1_t(i,:,:)), w_percep_agg, theta_percep_agg);
        end
        if pac/25000 > bestAcc
            bestMargin = margin;
            bestAcc = pac/25000;
        end
        pac = 0;
        margin = margin + 0.1;
    end
    accs(3,1) = bestMargin;
    accs(3,2) = bestAcc;
    
    % winnow
    bestScale = 0;
    bestAcc = 0;
    wc = 0;
    scale = 0.1;
    while scale <= 2.0
        for i = 1:5
            [w_win, theta_win, err_win] = learn_winnow(y1_tr(i,:,:).', squeeze(x1_tr(i,:,:)), scale, ones(n1,1), -n1);
            wc = wc + test(y1_t(i,:,:).', squeeze(x1_t(i,:,:)), w_win, theta_win);
        end
        if wc/25000 > bestAcc
            bestScale = scale;
            bestAcc = wc/25000;
        end
        wc = 0;
        scale = scale + 0.1;
    end
    accs(4,1) = bestScale;
    accs(4,2) = bestAcc;
    
    % concept 2
    % perceptron
    bestLearnRate = 0;
    bestAcc = 0;
    pc = 0;
    learnRate = 0.1;
    while learnRate <= 2.0
        for i = 1:5
            [w_percep, theta_percep, err_percep] = learn_perceptron(y2_tr(i,:,:).', squeeze(x2_tr(i,:,:)), learnRate, ones(n2,1), 0);
            pc = pc + test(y2_t(i,:,:).', squeeze(x2_t(i,:,:)), w_percep, theta_percep);
        end
        if pc/25000 > bestAcc
            bestLearnRate = learnRate;
            bestAcc = pc/25000;
        end
        pc = 0;
        learnRate = learnRate + 0.1;
    end
    accs(6,1) = bestLearnRate;
    accs(6,2) = bestAcc;
    
    % perceptron with margin
    bestMargin = 0;
    bestLearnRate = 0;
    bestAcc = 0;
    pmc = 0;
    learnRate = 0.0001;
    margin = 0;
    while margin <= 2.0
        while learnRate <= 1.5
            for i = 1:5
                [w_percep_mg, theta_percep_mg, err_percep_mg] = learn_perceptron_with_margin(y2_tr(i,:,:).', squeeze(x2_tr(i,:,:)), learnRate, margin, ones(n2,1), 0);
                pmc = pmc + test(y2_t(i,:,:).', squeeze(x2_t(i,:,:)), w_percep_mg, theta_percep_mg);
            end
            if pmc/25000 > bestAcc
                bestMargin = margin;
                bestLearnRate = learnRate;
                bestAcc = pmc/25000;
            end
            pmc = 0;
            learnRate = learnRate * 10;
        end
        margin = margin + 0.1;
    end
    accs(7,1) = bestLearnRate;
    accs(7,2) = bestMargin;
    accs(7,3) = bestAcc;
    
    % aggressive perceptron with margin
    bestMargin = 0;
    bestAcc = 0;
    pac = 0;
    margin = 0;
    while margin <= 2.0
        for i = 1:5
            [w_percep_agg, theta_percep_agg, err_percep_agg] = learn_aggressive_perceptron_with_margin(y2_tr(i,:,:).', squeeze(x2_tr(i,:,:)), margin, ones(n2,1), 0);
            pac = pac + test(y2_t(i,:,:).', squeeze(x2_t(i,:,:)), w_percep_agg, theta_percep_agg);
        end
        if pac/25000 > bestAcc
            bestMargin = margin;
            bestAcc = pac/25000;
        end
        pac = 0;
        margin = margin + 0.1;
    end
    accs(8,1) = bestMargin;
    accs(8,2) = bestAcc;
    
    % winnow
    bestScale = 0;
    bestAcc = 0;
    wc = 0;
    scale = 0.1;
    while scale <= 2.0
        for i = 1:5
            [w_win, theta_win, err_win] = learn_winnow(y2_tr(i,:,:).', squeeze(x2_tr(i,:,:)), scale, ones(n2,1), -n2);
            wc = wc + test(y2_t(i,:,:).', squeeze(x2_t(i,:,:)), w_win, theta_win);
        end
        if wc/25000 > bestAcc
            bestScale = scale;
            bestAcc = wc/25000;
        end
        wc = 0;
        scale = scale + 0.1;
    end
    accs(9,1) = bestScale;
    accs(9,2) = bestAcc;
    
end