%%
% Description
%
% This function evaluates the learned decision function on and (unlabeled) 
% testing data set.
%
% It also writes the predictions as a text string to the file 
% 'netID_noisy_predictions.txt', where netID is your Illinois NetID.
%
% You should copy and paste this string into the text box for the
% assignment 'Noisy Data Results' on Compass 
% (Problem Set 3/Part 2/Noisy Data Results), as well as attaching the text
% file with your results.
%%
% Input
%
% w:     n-by-1 weight vector
% theta: a scalar bias term
% x:     k-by-n matrix, where each row is an example to label
% netID: your Illinois NetID (e.g. ramusa2)
%%
% Output
%
% pred_y: a k-by-1 vector of class label predictions
function pred_y = get_predictions(w,theta,x, netID)
  [k,n] = size(x);
  pred_y = (x*w + ones(k,1) * theta > 0);
  pred_y = 2 * pred_y - ones(size(pred_y));
  csvwrite(strcat(netID, '_noisy_predictions.txt'), pred_y');
end
