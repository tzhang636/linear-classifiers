%%
% Description
%
%   This function generates the dataset for the first part of the homework.
%
%   You do not need to modify this function.
%%
% Input
%
% l: an integer
% m: an integer
% n: an integer (note l <= m <= n
% k: an integer that indicates the size of the dataset
%%
% Output
%
% y: k-by-1 vector, each element can be 1 or -1 (class label)
% x: k-by-n matrix, each row is an example in the dataset
function [y,x] = gen(l,m,n,number_of_instance)
    % precondition l <= m <= n

    p_number_of_instance = number_of_instance/2;
    n_number_of_instance = number_of_instance - p_number_of_instance;

    y = [];
    x = [];

    % positive example
    p_y = [ones(p_number_of_instance,1)];
    p_x = [zeros(p_number_of_instance,m) (rand(p_number_of_instance,n-m) < 0.5)];

    for i = 1:p_number_of_instance
      cands = randperm(m);
      n_nonzeros = l;
      % Simplify the concept
      %n_nonzeros = l + 1;
      active_features = cands(1,1:n_nonzeros);
      p_x(i,active_features) = 1; % set non_zeros to 1
    end

    % negative example
    n_y = [-1 * ones(n_number_of_instance,1)];
    n_x = [zeros(n_number_of_instance,m) (rand(n_number_of_instance,n-m) < 0.5)];
    for i = 1:n_number_of_instance
      cands = randperm(m);
      %n_nonzeros = randint(1,1,l); % choose non_zeros between
      %                             % [0,l-1]
      %n_nonzeros = l - 1;
      % Simplify the concept
      n_nonzeros = l - 2;
      active_features = cands(1,1:n_nonzeros);
      n_x(i,active_features) = 1; % set non_zeros to 1
    end

    y = [p_y;n_y];
    x = [p_x;n_x];

    % permute the dataset
    idx = randperm(number_of_instance);
    y = y(idx);
    x = x(idx,:);
