%%
% This script produces a sample mistake plot for the four online learning
% algorithms, using predetermined (hard-coded) parameters.
%
% It generates a random l-of-m-of-n data set, and trains each of the four
% online learning algorithms by iterating through the data set once. For 
% each algorithm, it obtains the learned weight vector (w) and bias term 
% (theta), as well as a vector containing the cumulative mistake count.
% Finally, it plots these mistake counts on a single graph, allowing us to
% compare the algorithms' convergence based on how many examples they see.
%
% You must implement the four learning algorithms in their respective
% function definitions before this script will produce meaningful output.
%%
function part1_plot()
% Set data set parameters; you may re-write this function to take these
% parameters as input arguments.
l1 = 10;
m1 = 100;
n1 = 500;

l2 = 10;
m2 = 100;
n2 = 1000;

k = 20000;

% Generate data
[y1, x1] = gen(l1, m1, n1, k);
[y2, x2] = gen(l2, m2, n2, k);

% Learn Winnow:
%   alpha = 1.2
%   w_0 = 1^n     (n-dimensional vectors of ones)
%   theta = -n
[w, theta, winnow_err1] = learn_w(y1, x1, 1.2, ones(n1, 1), -n1);
[w, theta, winnow_err2] = learn_w(y2, x2, 1.2, ones(n2, 1), -n2);

% Learn normal Perceptron:
%   eta = .1
%   w_0 = 1^n 
%   theta_0 = 0
[w,theta,perceptron_err1] = learn_p(y1, x1, 0.1, ones(n1, 1), 0);
[w,theta,perceptron_err2] = learn_p(y2, x2, 0.1, ones(n2, 1), 0);

% Learn Perceptron with margin:
%   eta = .01
%   gamma = 0.001
%   w_0 = 1^n 
%   theta_0 = 0
[w,theta,pcptrn_margin_err1] = learn_pm(y1, x1, 0.01, 0.001, ones(n1, 1), 0);
[w,theta,pcptrn_margin_err2] = learn_pm(y2, x2, 0.01, 0.001, ones(n2, 1), 0);

% Learn aggressive Perceptron:
%   gamma = 0.01
%   w_0 = 1^n 
%   theta_0 = 0
[w,theta,aggr_pcptrn_margin_err1] = learn_apm(y1, x1, 0.01, ones(n1, 1), 0);
[w,theta,aggr_pcptrn_margin_err2] = learn_apm(y2, x2, 0.01, ones(n2, 1), 0);

% Plot results
names = {'Winnow', 'Perceptron', 'Perceptron with margin', 'Aggressive Perceptron with margin'};
results = [winnow_err1'; perceptron_err1'; pcptrn_margin_err1'; aggr_pcptrn_margin_err1'];
plot_figure(1, 'Config 1 Mistakes', 'Number of Examples Seen', 'Number of Mistakes', names, results);

names = {'Winnow', 'Perceptron', 'Perceptron with margin', 'Aggressive Perceptron with margin'};
results = [winnow_err2'; perceptron_err2'; pcptrn_margin_err2'; aggr_pcptrn_margin_err2'];
plot_figure(2, 'Config 2 Mistakes', 'Number of Examples Seen', 'Number of Mistakes', names, results);
end